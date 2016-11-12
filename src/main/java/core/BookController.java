package core;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class BookController {

    @RequestMapping("/")
    public String index() {
        return "Greetings from Spring Boot!";
    }
}