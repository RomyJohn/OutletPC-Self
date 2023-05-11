package entities;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "outletpc_specifications")
public class Specifications implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String spec1;
    private String spec2;
    private String spec3;
    private String spec4;
    private String spec5;
    private String spec6;
    @OneToOne
    private ProductData productData;

    public String getSpec1() {
        return spec1;
    }

    public void setSpec1(String spec1) {
        this.spec1 = spec1;
    }

    public String getSpec2() {
        return spec2;
    }

    public void setSpec2(String spec2) {
        this.spec2 = spec2;
    }

    public String getSpec3() {
        return spec3;
    }

    public void setSpec3(String spec3) {
        this.spec3 = spec3;
    }

    public String getSpec4() {
        return spec4;
    }

    public void setSpec4(String spec4) {
        this.spec4 = spec4;
    }

    public String getSpec5() {
        return spec5;
    }

    public void setSpec5(String spec5) {
        this.spec5 = spec5;
    }

    public String getSpec6() {
        return spec6;
    }

    public void setSpec6(String spec6) {
        this.spec6 = spec6;
    }

    public ProductData getProductData() {
        return productData;
    }

    public void setProductData(ProductData productData) {
        this.productData = productData;
    }

}
