package bitcamp.chopchop.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.context.annotation.FilterType;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@ComponentScan(basePackages = "bitcamp.chopchop",
    excludeFilters = {@Filter(type = FilterType.REGEX, pattern = "bitcamp.chopchop.web.*")})

@EnableWebMvc 
public class AppConfig {

}
