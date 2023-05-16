package bean;

public class Product {
    private int id;
    private String name;
    private double price;
    private String desc;
    private String producer;

    public Product(int id, String name, double price, String desc, String producer) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.desc = desc;
        this.producer = producer;
    }

    public Product() {
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getProducer() {
        return producer;
    }

    public void setProducer(String producer) {
        this.producer = producer;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
