package bo.edu.ucb.sis.piratebay.dao;

import bo.edu.ucb.sis.piratebay.model.KardexModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;
import java.sql.Date;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;
@Service

public class KardexDao {
    private JdbcTemplate jdbcTemplate;
    @Autowired
    public KardexDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<KardexModel> findAll(Integer id) {
        // Implmentamos SQL varible binding para evitar SQL INJECTION
        String query = "SELECT id, product_warehouse_id,concept,kdate,invoice,income_q,income_uc,income_total," +
                " departure_q, departure_uc, departure_total, balance_q, balance_total" +
                " FROM \"kardex\" WHERE product_warehouse_id = "+id+" ORDER BY id";
        List<KardexModel> result = null;
        try {
            result = jdbcTemplate.query(query, new RowMapper<KardexModel>() {
                @Override
                public KardexModel mapRow(ResultSet resultSet, int i) throws SQLException {
                    return new KardexModel(resultSet.getInt(1),
                            resultSet.getInt(2),
                            resultSet.getString(3),
                            resultSet.getString(4),
                            resultSet.getString(5),
                            resultSet.getInt(6),
                            resultSet.getDouble(7),
                            resultSet.getDouble(8),
                            resultSet.getInt(9),
                            resultSet.getDouble(10),
                            resultSet.getDouble(11),
                            resultSet.getInt(12),
                            resultSet.getDouble(13)
                    );
                }
            });
        } catch (Exception ex) {
            throw new RuntimeException();
        }
        return result;
    }

    public boolean registraIngreso(KardexModel kardex)
    {
        String query = "INSERT INTO public.kardex(product_warehouse_id, concept, kdate, invoice, income_q, income_uc, income_total, balance_total, balance_q) " +
                "VALUES(?,?,?,?,?,?,?,?,?)";
        try {
            SimpleDateFormat fecha = new SimpleDateFormat("yyyy-mm-dd");
            java.util.Date date = fecha.parse(kardex.getKdate());
            jdbcTemplate.update(query, kardex.getProduct_warehouse_id(),kardex.getConcept(),date,kardex.getInvoice(),kardex.getIncome_q(),kardex.getIncome_uc(),kardex.getIncome_total(),kardex.getBalance_total(),kardex.getBalance_q());
        } catch (Exception ex) {
            System.out.print("XXXXXXXXXX"+ex.getMessage());
            throw new RuntimeException();
        }
        return true;
    }

}

