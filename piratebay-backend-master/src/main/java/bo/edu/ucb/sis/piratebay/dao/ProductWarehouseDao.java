package bo.edu.ucb.sis.piratebay.dao;

import bo.edu.ucb.sis.piratebay.model.ProductModel;
import bo.edu.ucb.sis.piratebay.model.ProductWarehouseModel;
import bo.edu.ucb.sis.piratebay.model.ProviderModel;
import bo.edu.ucb.sis.piratebay.model.WarehouseModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Service
public class ProductWarehouseDao {
    private JdbcTemplate jdbcTemplate;
    @Autowired
    public ProductWarehouseDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<ProductWarehouseModel> findAll(Integer _warehouse_id, String texto) {
        // Implmentamos SQL varible binding para evitar SQL INJECTION
        String query = "SELECT pw.id, pw.stock, pw.m_stock, pw.creation_date, " +
                "p.product_id, p.product_name, p.product_code, p.cat_product_type, p.product_description," +
                "w.warehouse_id, w.warehouse_name, w.warehouse_address," +
                "prov.provider_id, prov.provider_name, prov.cat_country" +
                " FROM \"product_warehouse\" pw JOIN " +
                "product p on p.product_id = pw.product_id JOIN " +
                "warehouse w on w.warehouse_id = pw.warehouse_id JOIN " +
                "provider prov on prov.provider_id = pw.provider_id" +
                " WHERE pw.warehouse_id = "+_warehouse_id+" AND " +
                "lower(CONCAT(p.product_code, p.cat_product_type,p.product_name,pw.creation_date,prov.provider_name,pw.stock)) LIKE '%"+texto+"%'";
        List<ProductWarehouseModel> result = null;
        try {
            result = jdbcTemplate.query(query, new RowMapper<ProductWarehouseModel>() {
                @Override
                public ProductWarehouseModel mapRow(ResultSet resultSet, int i) throws SQLException {
                    return new ProductWarehouseModel(resultSet.getInt(1),
                            resultSet.getInt(2),
                            resultSet.getInt(3),
                            resultSet.getString(4),
                            new WarehouseModel(resultSet.getInt(10),
                                    resultSet.getString(11),
                                    resultSet.getString(12)
                            ),
                            new ProductModel(resultSet.getInt(5),
                                    resultSet.getString(7),
                                    resultSet.getString(8),
                                    resultSet.getString(6),
                                    resultSet.getString(9)
                            ),
                            new ProviderModel(resultSet.getInt(13),
                                    resultSet.getString(14),
                                    resultSet.getString(15)
                            )
                    );
                }
            });
        } catch (Exception ex) {
            throw new RuntimeException();
        }
        return result;
    }
}

