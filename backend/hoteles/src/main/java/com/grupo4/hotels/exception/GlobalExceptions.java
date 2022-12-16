package com.grupo4.hotels.exception;

//<<<<<<< HEAD
//import org.apache.log4j.Logger;
//=======
import lombok.extern.slf4j.Slf4j;
//import org.apache.log4j.Logger;
//>>>>>>> 6a5be6f28a3e446eababf6e07da03c49ad125240
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

//<<<<<<< HEAD
//
//@ControllerAdvice
//public class GlobalExceptions {
//
//    private static Logger logger= Logger.getLogger(GlobalExceptions.class);
//
//    @ExceptionHandler({ResourceNotFoundException.class})
//    public ResponseEntity<String> tratarErrorNotFound(ResourceNotFoundException ex) {
//    logger.error(ex.getMessage());
//        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(ex.getMessage() + " - Global");
//    }
//
//
//=======
@Slf4j
@ControllerAdvice
public class GlobalExceptions {


    @ExceptionHandler({ResourceNotFoundException.class})
    public ResponseEntity<String> manageErrorNotFound(ResourceNotFoundException ex) {
    log.error(ex.getMessage());
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(ex.getMessage() + " - Not Found");
    }

    @ExceptionHandler({BadRequestException.class})
    public ResponseEntity<String> manageErrorBadRequest(BadRequestException ex) {
        log.error(ex.getMessage());
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(ex.getMessage() + " - Bad Request");
    }

    @ExceptionHandler({ForbiddenException.class})
    public ResponseEntity<String> manageErrorForbidden(ForbiddenException ex) {
        log.error(ex.getMessage());
        return ResponseEntity.status(HttpStatus.FORBIDDEN).body(ex.getMessage() + " - Forbidden");
    }

}
