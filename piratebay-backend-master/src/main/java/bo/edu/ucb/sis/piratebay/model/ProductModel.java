package bo.edu.ucb.sis.piratebay.model;

public class ProductModel {
    private Integer product_id;
    private String product_code;
    private String cat_product_type;
    private String product_name;
    private String product_description;

    public ProductModel()
    {
    }

    public ProductModel(Integer id, String code, String product_type, String name, String description)
    {
        product_id = id;
        product_code = code;
        cat_product_type = product_type;
        product_name = name;
        product_description= description;
    }

    public Integer getProduct_id() {
        return product_id;
    }

    public void setProduct_id(Integer product_id) {
        this.product_id = product_id;
    }

    public String getProduct_code() {
        return product_code;
    }

    public void setProduct_code(String product_code) {
        this.product_code = product_code;
    }

    public String getCat_product_type() {
        return cat_product_type;
    }

    public void setCat_product_type(String cat_product_type) {
        this.cat_product_type = cat_product_type;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getProduct_description() {
        return product_description;
    }

    public void setProduct_description(String product_description) {
        this.product_description = product_description;
    }
}


