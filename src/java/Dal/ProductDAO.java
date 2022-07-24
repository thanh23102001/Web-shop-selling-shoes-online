package Dal;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import Models.Images;
import Models.ProductFilter;
import Models.ProductList;
import Models.Product;
import Models.ProductDTO;
import Models.ProductDetailsDTO;
import Models.StatisticCB;
import Models.StatisticProducts;
import Models.Type;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Vu Van Tuyen
 */
public class ProductDAO extends DBContext {

    ImageDAO Idao = new ImageDAO();
    ResultSet rs;
    
    public List<Product> getRelatedProducts(int productId) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select top(9)* from Products p where p.SubCategoryID = (select SubCategoryID from Products where ProductId = ?) and p.Status = 'activate' ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product products = new Product(rs.getInt("ProductId"), rs.getString("ProductName"),
                        rs.getInt("SubCategoryID"), rs.getInt("BrandID"), rs.getString("Description"),
                        rs.getDouble("ImportPrice"), rs.getDouble("UnitPrice"),
                        rs.getDouble("Discount"), rs.getString("CreatedAt"), rs.getString("ModifiedAt"));
                products.setImages(Idao.getImagesByProductId(rs.getInt("ProductId")));
                products.setDetails(new ProductDetailsDAO().getProductDetails(rs.getInt("ProductId")));
                list.add(products);
            }
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public List<Product> getListProducts() {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select * from Products where Status='activate'\n";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product products = new Product(rs.getInt("ProductId"), rs.getString("ProductName"),
                        rs.getInt("SubCategoryID"), rs.getInt("BrandID"), rs.getString("Description"),
                        rs.getDouble("ImportPrice"), rs.getDouble("UnitPrice"),
                        rs.getDouble("Discount"), rs.getString("CreatedAt"), rs.getString("ModifiedAt"));
                products.setImages(Idao.getImagesByProductId(rs.getInt("ProductId")));
                products.setDetails(new ProductDetailsDAO().getProductDetails(rs.getInt("ProductId")));
                list.add(products);
            }
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public List<Product> getBin() {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select * from Products where Status!='activate'\n";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product products = new Product(rs.getInt("ProductId"), rs.getString("ProductName"),
                        rs.getInt("SubCategoryID"), rs.getInt("BrandID"), rs.getString("Description"),
                        rs.getDouble("ImportPrice"), rs.getDouble("UnitPrice"),
                        rs.getDouble("Discount"), rs.getString("CreatedAt"), rs.getString("ModifiedAt"));
                products.setImages(Idao.getImagesByProductId(rs.getInt("ProductId")));
                products.setDetails(new ProductDetailsDAO().getProductDetails(rs.getInt("ProductId")));
                list.add(products);
            }
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Product> getListProducts(String type, int top) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select top (" + top
                    + ")* from Products \n"
                    + " where Status = 'activate' "
                    + "order by " + type + " desc";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product products = new Product(rs.getInt("ProductId"), rs.getString("ProductName"),
                        rs.getInt("SubCategoryID"), rs.getInt("BrandID"), rs.getString("Description"),
                        rs.getDouble("ImportPrice"), rs.getDouble("UnitPrice"),
                        rs.getDouble("Discount"), rs.getString("CreatedAt"), rs.getString("ModifiedAt"));
                products.setImages(Idao.getImagesByProductId(rs.getInt("ProductId")));
                products.setDetails(new ProductDetailsDAO().getProductDetails(rs.getInt("ProductId")));
                list.add(products);
            }
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public double getMaxPrice() {
        double maxPrice = 0;
        try {
            String sql = "select max(UnitPrice)\n"
                    + "from Products where Status = 'activate'";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                maxPrice = rs.getDouble(1);
            }
        } catch (Exception e) {
        }
        return maxPrice;
    }

    public double getMinPrice() {
        double minPrice = 0;
        try {
            String sql = "select mn(UnitPrice)\n"
                    + "from Products where Status = 'activate'";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                minPrice = rs.getDouble(1);
            }
        } catch (Exception e) {
        }
        return minPrice;
    }

    /**
     *
     * @param productFilter
     * @return
     */
    public ProductList getProductListByFilter(ProductFilter productFilter) {
        ProductList productList = new ProductList();
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select COUNT (*) OVER () AS ROW_COUNT, * from Products p\n";
            if (!productFilter.getSubcategoryId().isEmpty()) {
                sql += sql.contains("where") ? "and" : "where";
                sql += " p.SubCategoryID in (" + productFilter.getSubcategoryId() + ")";
            }
            if (!productFilter.getBrandId().isEmpty()) {
                sql += sql.contains("where") ? "and" : "where";
                sql += " p.BrandID in (" + productFilter.getBrandId() + ")";
            }
            if (!productFilter.getSize().isEmpty() || !productFilter.getColor().isEmpty()) {
                sql += sql.contains("where") ? "and" : "where";
                sql += " p.ProductId in (select ProductId from ProductDetails where ";
                if (!productFilter.getSize().isEmpty()) {
                    sql += "Size like '%" + productFilter.getSize() + "%'";
                    if (!productFilter.getColor().isEmpty()) {
                        sql += " and ";
                    }
                }
                if (!productFilter.getColor().isEmpty()) {
                    sql += "Color like '%" + productFilter.getColor() + "%'";
                }
                sql += ")";
            }
            sql += productFilter.getSortBy().equals("price") ? " order by p.UnitPrice " : " order by p.CreatedAt ";
            sql += productFilter.isIsAsc() ? "asc" : "desc";
            sql += " OFFSET " + (productFilter.getCurrentPage() - 1) * productFilter.getRecordPerPage()
                    + " ROWS FETCH NEXT "
                    + productFilter.getRecordPerPage() + " ROWS ONLY";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            int rowCount = 0;
            while (rs.next()) {
                //int productId, String productName, int subCategoryId, int brandId, String desscription, 
                //double importPrice, double unitPrice, double discount, String createdAt, String modifiedAt
                Product products = new Product(rs.getInt("ProductId"), rs.getString("ProductName"),
                        rs.getInt("SubCategoryID"), rs.getInt("BrandID"), rs.getString("Description"),
                        rs.getDouble("ImportPrice"), rs.getDouble("UnitPrice"),
                        rs.getDouble("Discount"), rs.getString("CreatedAt"), rs.getString("ModifiedAt"));
                products.setImages(Idao.getImagesByProductId(rs.getInt("ProductId")));
                products.setDetails(new ProductDetailsDAO().getProductDetails(rs.getInt("ProductId")));
                list.add(products);
                rowCount = rs.getInt(1);
            }
            productList = new ProductList(list, rowCount);
        } catch (SQLException e) {
        }
        return productList;
    }

    public ArrayList<String> getTypesByProductId(String type, int productId) {
        ArrayList<String> list = new ArrayList<>();
        try {
            String sql = "select distinct " + type + " from ProductDetails where ProductId = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, productId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(rs.getString(1));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public Product getProductByProductId(int productId) {
        try {
            String sql = "select * from Products where ProductId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, productId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product product = new Product(rs.getInt("ProductId"), rs.getString("ProductName"),
                        rs.getInt("SubCategoryID"), rs.getInt("BrandID"), rs.getString("Description"),
                        rs.getDouble("ImportPrice"), rs.getDouble("UnitPrice"),
                        rs.getDouble("Discount"), rs.getString("CreatedAt"), rs.getString("ModifiedAt"));
                product.setImages(Idao.getImagesByProductId(rs.getInt("ProductId")));
                product.setColors(getTypesByProductId("color", rs.getInt("ProductId")));
                product.setSizes(getTypesByProductId("size", rs.getInt("ProductId")));
                return product;
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public int addProduct(String name, String scid, String bid, String des, double iprice, double uprice) {
        try {
            String sql = "INSERT INTO Products(ProductName, SubCategoryID, BrandID, Description, ImportPrice, UnitPrice, Discount , Status )\n" +
                        "VALUES (?, ?, ?, ?, ?, ?, 0 , 'activate')";
            PreparedStatement stm = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stm.setString(1, name);
            stm.setString(2, scid);
            stm.setString(3, bid);
            stm.setString(4, des);
            stm.setDouble(5, iprice);
            stm.setDouble(6, uprice);
            stm.executeUpdate();
            ResultSet rs = stm.getGeneratedKeys();
            if (rs.next()) {
                int pid = Integer.parseInt(rs.getString(1));
                return pid;
            }
        } catch (Exception ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
    
    public int updateProduct(int pid, String name, String scid, String bid, String des, double iprice, double uprice) {
        try {
            String sql = "Update Products(ProductName, SubCategoryID, BrandID, Description, ImportPrice, UnitPrice, Discount)\n" +
                        "set (?, ?, ?, ?, ?, ?, 0) where ProductId = ?";
            PreparedStatement stm = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stm.setString(1, name);
            stm.setString(2, scid);
            stm.setString(3, bid);
            stm.setString(4, des);
            stm.setDouble(5, iprice);
            stm.setDouble(6, uprice);
            stm.setInt(7, pid);
            stm.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
    
    public void deleteProduct(int productId) {
        try {
            String sql = "Update Products\n"
                    + " set Status = convert(varchar, getdate(), 105) where ProductId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, productId);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void restoreProduct(int pid) {
        try {
            String sql = "Update Products\n"
                    + " set Status = 'activate' where ProductId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pid);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    //Get statistics
    public ArrayList<StatisticCB> getTopProducts() {
        ArrayList<StatisticCB> list = new ArrayList<>();
        try {
            String sql = "Select top 5 p.ProductId, count(p.ProductId) as num from OrderDetails od, ProductDetails pd, Products p \n"
                    + "where od.ProductDetailID = pd.ProductDetailID and pd.ProductId = p.ProductId \n"
                    + "group by p.ProductId order by num desc";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product product = (new ProductDAO()).getProductByProductId(rs.getInt(1));
                list.add(new StatisticCB(product.getProductName(), rs.getInt(2)));
            }
        } catch (SQLException e) {
            
        }
        return list;
    }

    public ArrayList<StatisticCB> getTopRatedProducts() {
        ArrayList<StatisticCB> list = new ArrayList<>();
        try {
            String sql = "Select top 5 p.ProductId, avg(f.Rating) as rate from Products p, Feedbacks f, ProductDetails pd, OrderDetails od \n"
                    + "where f.OrderDetailId = od.OrderDetailId and od.ProductDetailID = pd.ProductDetailId and pd.ProductId = p.ProductId\n"
                    + "group by p.ProductId order by avg(f.Rating) desc";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product products = (new ProductDAO()).getProductByProductId(rs.getInt(1));
                list.add(new StatisticCB(products.getProductName(), rs.getInt(2)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public int getPurchasedProducts() {
        try {
            String sql = "Select count(pd.ProductDetailID) from OrderDetails od, ProductDetails pd where od.ProductDetailID = pd.ProductDetailID";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return -1;
    }

    public ArrayList<StatisticCB> getNumberProductsByCate() {
        ArrayList<StatisticCB> cs = new ArrayList();
        try {
            String sql = "Select c.CategoryName, count(p.ProductID) from Products p, SubCategories sc, Categories c\n"
                    + "where p.SubCategoryId = sc.SubCategoryId and sc.CategoryId = c.CategoryId\n"
                    + "group by c.CategoryName";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                String name = rs.getString(1);
                int count = rs.getInt(2);
                cs.add(new StatisticCB(name, count));
            }
        } catch (Exception e) {
        }
        return cs;
    }

    public ArrayList<StatisticCB> getNumberProductsByBrand() {
        ArrayList<StatisticCB> cs = new ArrayList();
        try {
            String sql = "Select b.BrandName, count(p.ProductID) from Products p, Brands b\n"
                    + "where b.BrandId = p.BrandID\n"
                    + "group by b.BrandName";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                String name = rs.getString(1);
                int count = rs.getInt(2);
                cs.add(new StatisticCB(name, count));
            }
        } catch (Exception e) {
        }
        return cs;
    }

    public ArrayList<StatisticProducts> getOutOfStocks() {
        ArrayList<StatisticProducts> cs = new ArrayList();
        try {
            String sql = "Select p.ProductId, p.ProductName, count(pd.ProductDetailId) as sl from Products p, ProductDetails pd where p.ProductId = pd.ProductId\n"
                    + "group by p.ProductId, p.ProductName having count(p.ProductId) = 0";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                int count = rs.getInt(3);
                cs.add(new StatisticProducts(id, name, count));
            }
        } catch (Exception e) {
        }
        return cs;
    }

    public ArrayList<StatisticProducts> getLowStocks() {
        ArrayList<StatisticProducts> cs = new ArrayList();
        try {
            String sql = "Select p.ProductId, p.ProductName, count(pd.ProductDetailId) as sl from Products p, ProductDetails pd where p.ProductId = pd.ProductId\n"
                    + "group by p.ProductId, p.ProductName having count(p.ProductId) <= 5";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                int count = rs.getInt(3);
                cs.add(new StatisticProducts(id, name, count));
            }
        } catch (Exception e) {
        }
        return cs;
    }
    
    //Tuyen
    private String getCondition(Integer catid, Integer brandId) {
        StringBuilder condition = new StringBuilder();
        if (catid != null) {
            if (condition.length() > 0) {
                condition.append(" and ");
            }
            condition.append("c.CategoryId=" + catid);
        }
        if (brandId != null) {
            if (condition.length() > 0) {
                condition.append(" and ");
            }
            condition.append("b.BrandId=" + brandId);
        }
        if (condition.length() > 0) {
            condition.insert(0, " where ");
        }
        return condition.toString();
    }
    
    private String getConditionCount(Integer catid, Integer brandId) {
        StringBuilder condition = new StringBuilder();
        if (catid != null) {
            if (condition.length() > 0) {
                condition.append(" and ");
            }
            condition.append("SubCategoryID=").append(catid);
        }
        if (brandId != null) {
            if (condition.length() > 0) {
                condition.append(" and ");
            }
            condition.append("BrandID=").append(brandId);
        }
        return condition.toString();
    }
    
    public List<Product> getListProducts(String cid, String bid) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select * from Products where Status='activate' \n";
            if(cid.length() > 0){
                sql += "and SubCategoryID = " + cid;
            }
            if(bid.length() > 0){
                sql += "and BrandId = " + bid;
            }
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product products = new Product(rs.getInt("ProductId"), rs.getString("ProductName"),
                        rs.getInt("SubCategoryID"), rs.getInt("BrandID"), rs.getString("Description"),
                        rs.getDouble("ImportPrice"), rs.getDouble("UnitPrice"),
                        rs.getDouble("Discount"), rs.getString("CreatedAt"), rs.getString("ModifiedAt"));
                products.setImages(Idao.getImagesByProductId(rs.getInt("ProductId")));
                products.setDetails(new ProductDetailsDAO().getProductDetails(rs.getInt("ProductId")));
                list.add(products);
            }
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    
    
    public ProductDTO getListProductsPaging(Integer catid, Integer brandId, int pagesize, int page) {
        List<ProductDTO.ProductDTORes> list = new ArrayList<>();
        String con = getCondition(catid, brandId);
        int count = 0;
        try {

            String sql = "SELECT ProductId,ProductName,c.CategoryName,b.BrandName,ImportPrice,UnitPrice,p.CreatedAt,p.ModifiedAt \n"
                    + "FROM Products p join Categories c on p.SubCategoryID=c.CategoryId\n"
                    + "join Brands b on b.BrandId=p.BrandID\n"
                    + con + " "
                    + "ORDER BY ProductName \n"
                    + "OFFSET " + pagesize * (page - 1)
                    + " ROWS\n"
                    + "FETCH NEXT " + pagesize + " ROWS ONLY;";
            String sqlCount = "SELECT count(*) \n"
                    + "FROM Products " + getConditionCount(catid, brandId);
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            int index = pagesize * (page - 1) + 1;
            while (rs.next()) {
                ProductDTO.ProductDTORes product = new ProductDTO.ProductDTORes(index++, rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getString(4),
                        rs.getDouble(5), rs.getDouble(6),
                        rs.getString(7), rs.getString(8));
                list.add(product);
            }
            ps = connection.prepareStatement(sqlCount);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = (int) Math.ceil((double) rs.getInt(1) / pagesize);
            }
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        ProductDTO res = new ProductDTO(list, count);
        return res;
    }
   
    public List<Type> getSubCategory() {
        List<Type> list = new ArrayList<>();
        try {
            String sql = "select SubCategoryId,SubCategoryName from SubCategories";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Type t = new Type(rs.getInt(1), rs.getString(2));
                list.add(t);
            }
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public List<Type> getCategory() {
        List<Type> list = new ArrayList<>();
        try {
            String sql = "select CategoryId,CategoryName from Categories";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Type t = new Type(rs.getInt(1), rs.getString(2));
                list.add(t);
            }
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Type> getBrand() {
        List<Type> list = new ArrayList<>();
        try {
            String sql = "select BrandId,BrandName from Brands";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Type t = new Type(rs.getInt(1), rs.getString(2));
                list.add(t);
            }
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public ProductDetailsDTO getProductDetail(int id) {
        ProductDetailsDTO res = new ProductDetailsDTO();
        String sql = "SELECT ProductName,c.CategoryName,b.BrandName,ImportPrice,UnitPrice,p.CreatedAt,p.ModifiedAt,Description \n"
                + "FROM Products p join Categories c on p.SubCategoryID=c.CategoryId join Brands b on b.BrandId=p.BrandID\n"
                + "where ProductId=" + id;
        res.setImg(Idao.getImagesUrl(id));
        res.setDetails(getSizeColor(id));
        try {
            Statement s = connection.createStatement();
            rs = s.executeQuery(sql);
            if (rs.next()) {
                res.setProductName(rs.getString(1));
                res.setCategory(rs.getString(2));
                res.setBrand(rs.getString(3));
                res.setImportPrice(rs.getInt(4));
                res.setUnitPrice(rs.getInt(5));
                res.setCreatedAt(rs.getString(6));
                res.setModifiedAt(rs.getString(7));
                res.setDes(rs.getString(8));
            }
        } catch (Exception e) {
        }
        return res;
    }

    private List<ProductDetailsDTO.ProductDetails> getSizeColor(int id) {
        List<ProductDetailsDTO.ProductDetails> ls = new ArrayList<>();
        String sql = "select Size,Color,QuantityInStock from ProductDetails where ProductId=" + id;
        try {
            Statement s = connection.createStatement();
            rs = s.executeQuery(sql);
            while (rs.next()) {
                ls.add(new ProductDetailsDTO.ProductDetails(rs.getString(1), rs.getString(2), rs.getInt(3)));
            }
        } catch (Exception e) {
        }
        return ls;
    }
    
    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
        System.out.println(dao.getListProducts("1", "1").size());
    }
}
