package config;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"initializer", "controllers"})
public class OutletpcApplication {

    public static void main(String[] args) {
        SpringApplication.run(OutletpcApplication.class, args);
    }

}
