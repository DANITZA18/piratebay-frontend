package bo.edu.ucb.sis.piratebay.bl;

import bo.edu.ucb.sis.piratebay.dao.WarehouseDao;
import bo.edu.ucb.sis.piratebay.model.WarehouseModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WarehouseBl {
    private WarehouseDao wareDao;
    @Autowired
    public WarehouseBl(WarehouseDao wareDao) {
        this.wareDao = wareDao;
    }

    public List<WarehouseModel> findAll() {
        return this.wareDao.findAll();
    }
}
