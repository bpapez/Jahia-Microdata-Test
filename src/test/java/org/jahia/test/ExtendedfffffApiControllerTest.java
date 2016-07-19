
package org.jahia.test;

import java.util.regex.Pattern;                                                                                            

import junit.framework.Assert;                                                                                              

import org.junit.Test;                                                                                                      

public class ExtendedfffffApiControllerTest {

  @Test                                                                                                                   
 public void regexpTest() {                                                                                                  
   Assert.assertTrue("/sites/mma.sag/contents/41/411201/agence/contactPDV"                                                   
       .contains("/sites/mma.sag"));                                                                                         
                                                                                                                             
   Assert.assertTrue(Pattern.matches("^BSI\\d{4}$", "BSI7276"));                                                             
   }

}