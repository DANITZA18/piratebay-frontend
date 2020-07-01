package bo.edu.ucb.sis.piratebay.model;

public class KardexModel {
    private Integer id;
    private Integer product_warehouse_id;
    private String concept;
    private String kdate;
    private String invoice;
    private Integer income_q;
    private Number income_uc;
    private Number income_total;
    private Integer departure_q;
    private Number departure_uc;
    private Number departure_total;
    private Integer balance_q;
    private Number balance_total;

    public KardexModel()
    {
    }

    public KardexModel(Integer id, Integer pwid, String concept, String kdate, String invoice, Integer iq, Number iuc, Number it, Integer dq, Number duc, Number dt, Integer bq, Number bt)
    {
        this.id = id;
        this.product_warehouse_id = pwid;
        this.concept = concept;
        this.kdate = kdate;
        this.invoice = invoice;
        this.income_q = iq;
        this.income_uc = iuc;
        this.income_total = it;
        this.departure_q = dq;
        this.departure_uc = duc;
        this.departure_total = dt;
        this.balance_q = bq;
        this.balance_total = bt;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProduct_warehouse_id() {
        return product_warehouse_id;
    }

    public void setProduct_warehouse_id(Integer product_warehouse_id) {
        this.product_warehouse_id = product_warehouse_id;
    }

    public String getConcept() {
        return concept;
    }

    public void setConcept(String concept) {
        this.concept = concept;
    }

    public String getKdate() {
        return kdate;
    }

    public void setKdate(String kdate) {
        this.kdate = kdate;
    }

    public String getInvoice() {
        return invoice;
    }

    public void setInvoice(String invoice) {
        this.invoice = invoice;
    }

    public Integer getIncome_q() {
        return income_q;
    }

    public void setIncome_q(Integer income_q) {
        this.income_q = income_q;
    }

    public Number getIncome_uc() {
        return income_uc;
    }

    public void setIncome_uc(Number income_uc) {
        this.income_uc = income_uc;
    }

    public Number getIncome_total() {
        return income_total;
    }

    public void setIncome_total(Number income_total) {
        this.income_total = income_total;
    }

    public Integer getDeparture_q() {
        return departure_q;
    }

    public void setDeparture_q(Integer departure_q) {
        this.departure_q = departure_q;
    }

    public Number getDeparture_uc() {
        return departure_uc;
    }

    public void setDeparture_uc(Number departure_uc) {
        this.departure_uc = departure_uc;
    }

    public Number getDeparture_total() {
        return departure_total;
    }

    public void setDeparture_total(Number departure_total) {
        this.departure_total = departure_total;
    }

    public Integer getBalance_q() {
        return balance_q;
    }

    public void setBalance_q(Integer balance_q) {
        this.balance_q = balance_q;
    }

    public Number getBalance_total() {
        return balance_total;
    }

    public void setBalance_total(Number balance_total) {
        this.balance_total = balance_total;
    }
}

