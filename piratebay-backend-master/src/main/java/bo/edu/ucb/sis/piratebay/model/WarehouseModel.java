package bo.edu.ucb.sis.piratebay.model;

public class WarehouseModel {
    private Integer warehouse_id;
    private String warehouse_name;
    private String warehouse_address;

    public WarehouseModel()
    {
    }

    public WarehouseModel(Integer id, String name, String address)
    {
        warehouse_id = id;
        warehouse_name = name;
        warehouse_address = address;
    }

    public Integer getWarehouse_id() {
        return warehouse_id;
    }

    public void setWarehouse_id(Integer warehouse_id) {
        this.warehouse_id = warehouse_id;
    }

    public String getWarehouse_name() {
        return warehouse_name;
    }

    public void setWarehouse_name(String warehouse_name) {
        this.warehouse_name = warehouse_name;
    }

    public String getWarehouse_address() {
        return warehouse_address;
    }

    public void setWarehouse_address(String warehouse_address) {
        this.warehouse_address = warehouse_address;
    }

    @Override
    public String toString() {
        return "WareHouseModel{" +
                "warehouse_id=" + warehouse_id +
                ", warehouse_name='" + warehouse_name + '\'' +
                ", warehouse_address='" + warehouse_address + '\'' +
                '}';
    }
}

