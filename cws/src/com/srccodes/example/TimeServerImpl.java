package com.srccodes.example;

import java.util.Date;
import javax.jws.WebService;

/**
 *  The @WebService property endpointInterface links the
 *  SIB (this class) to the SEI (javasamples.one.TimeServer).
 *  Note that the method implementations are not annotated
 *  as @WebMethods.
*/

@WebService(endpointInterface = "com.srccodes.example.TimeServer")

public class TimeServerImpl implements TimeServer {

    public String getTimeAsString() 
    { 
    	System.out.println("Hello World");
    	return "Sasa - I am"; 
//    	return new Date().toString(); 
    }
    
    public long getTimeAsElapsed() 
    { 
    	return new Date().getTime(); 
    }

}