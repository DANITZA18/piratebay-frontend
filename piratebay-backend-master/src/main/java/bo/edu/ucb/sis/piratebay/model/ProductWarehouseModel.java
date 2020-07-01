package bo.edu.ucb.sis.piratebay.model;
import java.sql.Date;
public class ProductWarehouseModel {
    private Integer id;
    private Integer stock;
    private Integer m_stock;
    private String creation_date;
    private WarehouseModel warehouse;
    private ProductModel product;
    private ProviderModel provider;

    public ProductWarehouseModel()
    {
    }

    public ProductWarehouseModel(Integer id, Integer stock, Integer m_stock, String date, WarehouseModel warehouse, ProductModel product, ProviderModel provider)
    {
        this.id = id;
        this.stock = stock;
        this.m_stock = m_stock;
        this.creation_date = date;
        this.warehouse = warehouse;
        this.product = product;
        this.provider = provider;
    }

    public WarehouseModel getWarehouse() {
        return warehouse;
    }

    public void setWarehouse(WarehouseModel warehouse) {
        this.warehouse = warehouse;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public Integer getM_stock() {
        return m_stock;
    }

    public void setM_stock(Integer m_stock) {
        this.m_stock = m_stock;
    }

    public String getCreation_date() {
        return creation_date;
    }

    public void setCreation_date(String creation_date) {
        this.creation_date = creation_date;
    }

    public ProductModel getProduct() {
        return product;
    }

    public void setProduct(ProductModel product) {
        this.product = product;
    }

    public ProviderModel getProvider() {
        return provider;
    }

    public void setProvider(ProviderModel provider) {
        this.provider = provider;
    }
}

