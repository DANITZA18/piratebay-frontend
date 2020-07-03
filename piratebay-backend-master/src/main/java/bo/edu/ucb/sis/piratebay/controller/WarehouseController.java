package bo.edu.ucb.sis.piratebay.controller;

import bo.edu.ucb.sis.piratebay.bl.WarehouseBl;
import bo.edu.ucb.sis.piratebay.model.WarehouseModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/v1/warehouse")
@CrossOrigin(origins = "*")
public class WarehouseController {
    private WarehouseBl wareBl;

    @Value("${piratebay.security.secretJwt}")
    private String secretJwt;

    @Autowired
    public WarehouseController(WarehouseBl wareBl) {
        this.wareBl = wareBl;
    }

    @RequestMapping(method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<WarehouseModel>> almacenes() {
        return new ResponseEntity<>( this.wareBl.findAll(), HttpStatus.OK);
    }
}
