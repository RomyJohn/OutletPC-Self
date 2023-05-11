package entities;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "outletpc_product")
public class ProductData implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String title;
    private String stock;
    private int discount;
    private int price;
    @Lob
    private String description;
    private String image;
    private String brand;
    @ManyToOne
    private CategoryData categoryData;

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getStock() {
        return stock;
    }

    public int getDiscount() {
        return discount;
    }

    public int getPrice() {
        return price;
    }

    public String getDescription() {
        return description;
    }

    public String getImage() {
        return image;
    }

    public String getBrand() {
        return brand;
    }

    public CategoryData getCategoryData() {
        return categoryData;
    }

}
