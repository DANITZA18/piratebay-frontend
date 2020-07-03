package bo.edu.ucb.sis.piratebay.bl;

import bo.edu.ucb.sis.piratebay.dao.ProductWarehouseDao;
import bo.edu.ucb.sis.piratebay.model.ProductWarehouseModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductWarehouseBl {
    private ProductWarehouseDao prodwareDao;
    @Autowired
    public ProductWarehouseBl(ProductWarehouseDao prodwareDao) {
        this.prodwareDao = prodwareDao;
    }

    public List<ProductWarehouseModel> findAll(Integer id, String texto) {
        return this.prodwareDao.findAll(id,texto);
    }
}
