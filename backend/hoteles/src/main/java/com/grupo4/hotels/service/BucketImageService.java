package com.grupo4.hotels.service;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.grupo4.hotels.dto.Image.ImageWithTitle;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.AwsCredentialsProvider;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;
//import software.amazon.awssdk.services.s3.model.PutObjectRequest;

import javax.annotation.PostConstruct;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;
import java.util.function.Consumer;

@Service
public class BucketImageService {

    private AmazonS3 s3client;

    @Value("${aws.s3.bucket}")
    private String bucketName;
    @Value("${aws.access_key_id}")
    private String accessKey;
    @Value("${aws.secret_access_key}")
    private String secretKey;

    private String endpointUrl = "https://s3imagesgittravel.s3.sa-east-1.amazonaws.com";

    // para crear el cliente que va a a interactuar con el bukect
    //La anotación @PostConstruct en Java se utiliza para indicar que un método debe ejecutarse después de que la inyección de dependencias en un bean ha sido completada
    @PostConstruct
    private void initializeAmazon() {
        AWSCredentials credentials = new BasicAWSCredentials(this.accessKey, this.secretKey);
        AwsCredentialsProvider provider = StaticCredentialsProvider.create(
                AwsBasicCredentials.create(this.accessKey, this.secretKey));
        //this.s3client = AmazonS3ClientBuilder.standard()
        //       .withCredentials(new AWSStaticCredentialsProvider(credentials)).build();
        this.s3client = AmazonS3ClientBuilder.standard().withRegion(Regions.fromName("sa-east-1"))
                .withCredentials(new AWSStaticCredentialsProvider(credentials)).build();


    }

    // como recibimos un archivo MultipartFile
    private File convertMultiPartToFile(MultipartFile file) throws IOException {
        File convFile = new File(file.getOriginalFilename());
        FileOutputStream fos = new FileOutputStream(convFile);
        fos.write(file.getBytes());
        fos.close();
        return convFile;


    }

    // para generar el nombre del archivo que vamos a cargar a s3
    private String generateFileName(MultipartFile multiPart) {
        return new Date().getTime() + "-" + multiPart.getOriginalFilename().replace(" ", "_");
    }

    // Método para enviar el archivo a S3
    private void uploadFileTos3bucket(String fileName, File file) {
        PutObjectRequest request = new PutObjectRequest(bucketName, fileName, file);
        s3client.putObject(request);
    }

    //
    public List<String> uploadFile(MultipartFile[] files) {
        List<String> urls = new ArrayList<>();
        String fileUrl = "";
        for (MultipartFile multipartFile : files) {
            try {
                File file = convertMultiPartToFile(multipartFile);
                String fileName = generateFileName(multipartFile);
                fileUrl = endpointUrl + "/" + fileName;
                urls.add(fileUrl);
                uploadFileTos3bucket(fileName, file);
                file.delete();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return urls;
    }

    public List<ImageWithTitle> uploadFileWithTitle(MultipartFile[] files) {
        List<ImageWithTitle> images = new ArrayList<>();
        String fileUrl = "";
        for (MultipartFile multipartFile : files) {
            try {
                ImageWithTitle NewImage = new ImageWithTitle();
                File file = convertMultiPartToFile(multipartFile);
                String fileName = generateFileName(multipartFile);
                fileUrl = endpointUrl + "/" + fileName;
                NewImage.setUrl(fileUrl);
                NewImage.setTitle(multipartFile.getOriginalFilename());
                images.add(NewImage);
                uploadFileTos3bucket(fileName, file);
                file.delete();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return images;
    }

    public ImageWithTitle uploadMainImage(MultipartFile mainFile) {
        ImageWithTitle image = new ImageWithTitle();
        String fileUrl = "";
            try {
                File file = convertMultiPartToFile(mainFile);
                String fileName = generateFileName(mainFile);
                fileUrl = endpointUrl + "/" + fileName;
                image.setUrl(fileUrl);
                image.setTitle(mainFile.getOriginalFilename());
                uploadFileTos3bucket(fileName, file);
                file.delete();
            } catch (Exception e) {
                e.printStackTrace();
            }
        return image;
    }

}