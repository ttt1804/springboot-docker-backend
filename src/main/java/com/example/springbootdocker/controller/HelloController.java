package com.example.springbootdocker.controller;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(path = "api")
// http://localhost:443/api/hello
public class HelloController {

    @CrossOrigin(origins = "http://34.143.247.201")
    @GetMapping("/hello")
    public String hello() {
        return "Hello world";
    }

    @GetMapping("/bye")
    public String bye() {
        return "Bye";
    }
}
