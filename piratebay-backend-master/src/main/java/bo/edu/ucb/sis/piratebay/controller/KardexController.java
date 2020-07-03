package bo.edu.ucb.sis.piratebay.controller;

import bo.edu.ucb.sis.piratebay.bl.KardexBl;
import bo.edu.ucb.sis.piratebay.model.KardexModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/kardex")
@CrossOrigin(origins = "*")
public class KardexController {

    private KardexBl karBl;

    @Value("${piratebay.security.secretJwt}")
    private String secretJwt;

    @Autowired
    public KardexController(KardexBl karBl) {
        this.karBl = karBl;
    }

    @RequestMapping(method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<KardexModel>> kardex(@RequestParam(name = "id")Integer id) {
        return new ResponseEntity<>( this.karBl.findAll(id), HttpStatus.OK);
    }

    @CrossOrigin(origins = "*")
    @RequestMapping(value="ingreso",
            method = RequestMethod.POST,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public boolean ingreso(@RequestBody KardexModel kardex) {
        return karBl.registraIngreso(kardex);
    }

}

