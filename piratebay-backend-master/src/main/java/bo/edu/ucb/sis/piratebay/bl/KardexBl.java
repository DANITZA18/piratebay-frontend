package bo.edu.ucb.sis.piratebay.bl;

import bo.edu.ucb.sis.piratebay.dao.KardexDao;
import bo.edu.ucb.sis.piratebay.model.KardexModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class KardexBl {
    private KardexDao karDao;
    @Autowired
    public KardexBl(KardexDao karDao) {
        this.karDao = karDao;
    }

    public List<KardexModel> findAll(Integer id) {
        return this.karDao.findAll(id);
    }

    public boolean registraIngreso(KardexModel kardex){return this.karDao.registraIngreso(kardex);}
}

