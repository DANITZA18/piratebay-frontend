package bo.edu.ucb.sis.piratebay.model;

public class ProviderModel {
    private Integer provider_id;
    private String provider_name;
    private String cat_country;

    public ProviderModel(){

    }

    public ProviderModel(Integer id, String name, String country)
    {
        provider_id = id;
        provider_name = name;
        cat_country = country;
    }

    public Integer getProvider_id() {
        return provider_id;
    }

    public void setProvider_id(Integer provider_id) {
        this.provider_id = provider_id;
    }

    public String getProvider_name() {
        return provider_name;
    }

    public void setProvider_name(String provider_name) {
        this.provider_name = provider_name;
    }

    public String getCat_country() {
        return cat_country;
    }

    public void setCat_country(String cat_country) {
        this.cat_country = cat_country;
    }
}
