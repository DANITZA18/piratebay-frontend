package bo.edu.ucb.sis.piratebay.controller;

import bo.edu.ucb.sis.piratebay.bl.ProductWarehouseBl;
import bo.edu.ucb.sis.piratebay.model.ProductWarehouseModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/products")
@CrossOrigin(origins = "*")

public class ProductWarehouseController {
    private ProductWarehouseBl prodWarBl;

    @Value("${piratebay.security.secretJwt}")
    private String secretJwt;

    @Autowired
    public ProductWarehouseController(ProductWarehouseBl prodWarBl) {
        this.prodWarBl = prodWarBl;
    }

    @RequestMapping(value="/warehouse",method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<ProductWarehouseModel>> productos(@RequestParam(name = "id")Integer id, @RequestParam(name = "texto")String texto)
    {
        return new ResponseEntity<>( this.prodWarBl.findAll(id,texto.toLowerCase()), HttpStatus.OK);
    }
}
