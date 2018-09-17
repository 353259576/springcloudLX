package org.ws.java.order.wsutils;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import javax.crypto.spec.IvParameterSpec;
import java.io.ByteArrayOutputStream;
import java.security.*;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

public class Encryption {

    public static final String RSA_ALGORITHM = "RSA";
    public static final String DES_ALGORITHM = "DES";
    public static final String DES_INTERFACE = "DES/CBC/PKCS5Padding";
    public static final String CHARSET = "UTF-8";
    public static final String PUBLIC_KEY = "publicKey";
    public static final String PRIVATE_KEY = "privateKey";
    private static final char[] HEX_DIGITS = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};


    public static void main(String[] args) {
        String privateKey = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCcIgueNTYe+yHuw3riC2K5K31wnkXo1/nQtTG6QJptDmNLkd2Ucf2d51RJgbdSLMTvLDTNoq08+VZdYX9OuPWAdE96yHLGJOOLOcRYTtGDL6UBUQDicZ1ukM1TJqgoaD/gffd4z4AQqQpUN5C786z1W2EKMnr+ASWjWxt77dhvXb/xa2AYv3rQZ/9cSx1KJs7ukX/KLA3tM+azMlMfY30i+8qNf+DrkTk1tpEzfYnjSinpZz+mw4LYwQ5EVklfVggMd6FNaZOVXtd/L0NNPVXOQ8PAxXXlLPNBISNeWTgHiz8itzfdQCizNsm3suo1MtjsR0Rb9yrDHSDmm4W4QMaLAgMBAAECggEADtIYgjsQ2R4DmZOKvZxREby0GpWbkz+1If+hKcnqHsIH4OuGugmcBnooARZEHZPMWdu7Y222vhv4+8I+gG2EOF5SERin9HEZ/GROZAePUcGbCyXyTIx2YkFyjBsWSUekEJ5EeH5R7MLvDRF9Nqop19yFuJ8UF7pqJTiHwlrQebmpgpKHCnpS4VGeT/r2hmQrxMw0wYZ6sGQBZbhGb/yeGuPcNg67sY+2h2M9wEfyxd7QlUsUbdoJIwbFNtBD0poH6x+JHK3gf4qTwKOupbcae8lvj0RYPc7vpQJuo0rjaFo7EMuaXf9MBnZu7jJAdQ8LtSe2RCxiUMRgezdncIqF2QKBgQDJ4NV/dUpAiCi8/KHQnCU8E14uXOE71HyMIoeWr8uwqwb3ne5hRMHVY0jFmZWF0Eru7L14EzbDfUz/wAgnCEjKXYPjAXDyN25+5DQKhtp+axHw8s/bYvOg5bSn+X7WcJ517YLPyl7OfSSmczwg42c5FXEK0TwmLXL4poF9h8w7TwKBgQDF/aeMErcN76t11DCAL6TlKM/qb+qPUF1oEuxS/xWC1CLJEB78XjQAEWY3w/mVzBHaZrkZYyMdDiz6qHUJaHbvsi8yX+4MGGQCYqC4FGCcbDXCetajGloEoA90SUKg/kUUJILVYxjnvTuaC1bJBMgDQGmxQTVMYwVBU/t4kyMCBQKBgFYaPvUN4Y2EhVuVpK6E6pyk5haAJtCN4FEkqQ/sCsRfLamPAo0Z9lI89lzRFKTuIgelkWoVR9Y5Kw4pqVB8iA9Hs2iuxK2KVuZoDoou2iHxKMXLyjuYCLEnR9Yc46wyfGNv2csmVSlc1rTnkU21r+D49C3Y7/6Yg+Dpo3EW6lShAoGAVudViXgVfTp7ygZPG5TODf/x8vcYv7sIpMvZizyH1psCgbpfv2oh7P22HjgY7xVZqMF58ZjAKtq0B3m1lWGTAvb1HGla9VgnXZyo6uOW3FHq7ug4GfNRG8Kdxe76Hew9qe+0tbD/l4hKBv1/JFDC8hptye3TVSoJfnk8YdpDfXkCgYEAvPjfMaN7VSvPBn3YMyLwSgxalqHAOfVl+ybUhHmsZY/XmzZFrYbL2/8bzYiMUrdb09Z56qBRaJgfJ3Ws4vUvygPQPtHUueB7O3m6FbWkSG05SrUhuEcNQoba+KUAwCdRNlXWfvBxdXT5JMlkQ53oe33b8zAluIkhfBZurMVwymQ=";
        String publicKey = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAnCILnjU2Hvsh7sN64gtiuSt9cJ5F6Nf50LUxukCabQ5jS5HdlHH9nedUSYG3UizE7yw0zaKtPPlWXWF/Trj1gHRPeshyxiTjiznEWE7Rgy+lAVEA4nGdbpDNUyaoKGg/4H33eM+AEKkKVDeQu/Os9VthCjJ6/gElo1sbe+3Yb12/8WtgGL960Gf/XEsdSibO7pF/yiwN7TPmszJTH2N9IvvKjX/g65E5NbaRM32J40op6Wc/psOC2MEORFZJX1YIDHehTWmTlV7Xfy9DTT1VzkPDwMV15SzzQSEjXlk4B4s/Irc33UAoszbJt7LqNTLY7EdEW/cqwx0g5puFuEDGiwIDAQAB";
        RSAPrivateKey rsaPrivateKey = getPrivateKey(privateKey);
        RSAPublicKey rsaPublicKey = getPublicKey(publicKey);
        String data = "复活复活123123复活复活123123复活复活123123复活复活123123复活复活123123复活复活123123复活复活123123";
        String publicString = publicKeyEncoder(data,rsaPublicKey);
        String publicStringEncoder = privateKeyDecoder(publicString,rsaPrivateKey);
        String privateString = privateKeyEncoder(data,rsaPrivateKey);
        String privateStringEncoder = publicKeyDecoder(privateString,rsaPublicKey);
        System.out.println(publicString);
        System.out.println(publicStringEncoder);
        System.out.println(privateString);
        System.out.println(privateStringEncoder);
        //System.out.println(JSON.toJSONString(createKeys(2048)));
        System.out.println(sha1Encoder("年贺岁档"));
        String password = "199645";
        String str = "你好世界";
        String desEncoder = desEncoder(str,password);
        System.out.println(desEncoder);
        System.out.println(desDecoder(desEncoder,password));
    }





    //*****************************************************************************************************
    public static String desEncoder(String str,String password){
        try {
            password = md5Encoder(password).substring(0,8);
            //SecureRandom secureRandom = new SecureRandom();
            IvParameterSpec ivParameterSpec = new IvParameterSpec(password.getBytes());
            DESKeySpec desKeySpec = new DESKeySpec(password.getBytes());
            SecretKeyFactory secretKeyFactory = SecretKeyFactory.getInstance(DES_ALGORITHM);
            SecretKey secretKey = secretKeyFactory.generateSecret(desKeySpec);
            Cipher cipher = Cipher.getInstance(DES_INTERFACE);
            cipher.init(Cipher.ENCRYPT_MODE,secretKey,ivParameterSpec);
            return Base64.getEncoder().encodeToString(cipher.doFinal(str.getBytes()));
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    public static String desDecoder(String str,String password){
        try {
            password = md5Encoder(password).substring(0,8);
            //SecureRandom secureRandom = new SecureRandom();
            IvParameterSpec ivParameterSpec = new IvParameterSpec(password.getBytes());
            DESKeySpec desKeySpec = new DESKeySpec(password.getBytes());
            SecretKeyFactory secretKeyFactory = SecretKeyFactory.getInstance(DES_ALGORITHM);
            SecretKey secretKey = secretKeyFactory.generateSecret(desKeySpec);
            Cipher cipher = Cipher.getInstance(DES_INTERFACE);
            cipher.init(Cipher.DECRYPT_MODE,secretKey,ivParameterSpec);
            return new String(cipher.doFinal(Base64.getDecoder().decode(str.getBytes(CHARSET))));
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;

    }







    //*****************************************************************************************************

    /**
     * sha1加密
     * @param str
     * @return
     */
    public static String sha1Encoder(String str){
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("SHA1");
            messageDigest.update(str.getBytes("UTF-8"));
            byte bytes[] = messageDigest.digest();
            return byteHexToString(bytes);
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;

    }

    /**
     * md5加密
     * @param str
     * @return
     */
    public static String md5Encoder(String str){
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("MD5");
            messageDigest.update(str.getBytes("UTF-8"));
            byte bytes[] = messageDigest.digest();
            return byteHexToString(bytes);
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;

    }


    private static String byteHexToString(byte bytes[]){
        StringBuffer stringBuffer = new StringBuffer();
        for(int i = 0; i < bytes.length; i++){
            stringBuffer.append(HEX_DIGITS[(bytes[i] >> 4) & 0x0f]);
            stringBuffer.append(HEX_DIGITS[bytes[i] & 0x0f]);
        }
        return stringBuffer.toString();
    }





    //******************************************************************************************************
    /**
     * 获取公钥私钥
     * @param keySize
     * @return
     */
    public static Map<String,String> createKeys(int keySize){
        KeyPairGenerator keyPairGenerator = null;
        try {
            keyPairGenerator = KeyPairGenerator.getInstance(RSA_ALGORITHM);
        }catch (NoSuchAlgorithmException e){
            e.printStackTrace();
        }
        if(keyPairGenerator != null){
            keyPairGenerator.initialize(keySize);
            KeyPair keyPair = keyPairGenerator.generateKeyPair();
            Key publicKey = keyPair.getPublic();
            Key privateKey = keyPair.getPrivate();
            String publicKeyString = Base64.getEncoder().encodeToString(publicKey.getEncoded());
            String privateKeyString = Base64.getEncoder().encodeToString(privateKey.getEncoded());
            Map<String,String> map = new HashMap<>();
            map.put(PUBLIC_KEY,publicKeyString);
            map.put(PRIVATE_KEY,privateKeyString);
            return map;
        }else {
            return null;
        }

    }


    /**
     * 公钥翻译为公钥
     * @param publicKey
     * @return
     */
    public static RSAPublicKey getPublicKey(String publicKey){
        try {
            KeyFactory keyFactory = KeyFactory.getInstance(RSA_ALGORITHM);
            X509EncodedKeySpec x509EncodedKeySpec = new X509EncodedKeySpec(Base64.getDecoder().decode(publicKey.getBytes()));
            RSAPublicKey rsaPublicKey = (RSAPublicKey) keyFactory.generatePublic(x509EncodedKeySpec);
            return rsaPublicKey;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 私钥翻译为私钥
     * @param privateKey
     * @return
     */
    public static RSAPrivateKey getPrivateKey(String privateKey){
        try {
            KeyFactory keyFactory = KeyFactory.getInstance(RSA_ALGORITHM);
            PKCS8EncodedKeySpec pkcs8EncodedKeySpec = new PKCS8EncodedKeySpec(Base64.getDecoder().decode(privateKey.getBytes()));
            RSAPrivateKey rsaPrivateKey = (RSAPrivateKey) keyFactory.generatePrivate(pkcs8EncodedKeySpec);
            return rsaPrivateKey;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 公钥加密
     * @param data
     * @param rsaPublicKey
     * @return
     */
    public static String publicKeyEncoder(String data,RSAPublicKey rsaPublicKey){
        try {
            Cipher cipher = Cipher.getInstance(RSA_ALGORITHM);
            cipher.init(Cipher.ENCRYPT_MODE,rsaPublicKey);
            return new String(Base64.getEncoder().encode(rsaSplitCode(cipher,Cipher.ENCRYPT_MODE,data.getBytes(CHARSET),rsaPublicKey.getModulus().bitLength())));
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 公钥解密
     * @param data
     * @param rsaPublicKey
     * @return
     */
    public static String publicKeyDecoder(String data,RSAPublicKey rsaPublicKey){
        try {
            Cipher cipher = Cipher.getInstance(RSA_ALGORITHM);
            cipher.init(Cipher.DECRYPT_MODE,rsaPublicKey);
            return new String(rsaSplitCode(cipher,Cipher.DECRYPT_MODE,Base64.getDecoder().decode(data),rsaPublicKey.getModulus().bitLength()),CHARSET);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 私钥加密
     * @param data
     * @param rsaPrivateKey
     * @return
     */
    public static String privateKeyEncoder(String data,RSAPrivateKey rsaPrivateKey){
        try {
            Cipher cipher = Cipher.getInstance(RSA_ALGORITHM);
            cipher.init(Cipher.ENCRYPT_MODE,rsaPrivateKey);
            return new String(Base64.getEncoder().encode(rsaSplitCode(cipher,Cipher.ENCRYPT_MODE,data.getBytes(CHARSET),rsaPrivateKey.getModulus().bitLength())));
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 私钥解密
     * @param data
     * @param rsaPrivateKey
     * @return
     */
    public static String privateKeyDecoder(String data,RSAPrivateKey rsaPrivateKey){
        try {
            Cipher cipher = Cipher.getInstance(RSA_ALGORITHM);
            cipher.init(Cipher.DECRYPT_MODE,rsaPrivateKey);
            return new String(rsaSplitCode(cipher,Cipher.DECRYPT_MODE,Base64.getDecoder().decode(data),rsaPrivateKey.getModulus().bitLength()),CHARSET);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }


    /**
     * 开始加密解密
     * @param cipher
     * @param opmode
     * @param dataBytes
     * @param keySize
     * @return
     */
    private static byte[] rsaSplitCode(Cipher cipher,int opmode,byte[] dataBytes,int keySize){
        int maxBlock = 0;
        if(opmode==Cipher.DECRYPT_MODE){
            maxBlock = keySize / 8;
        }else {
            maxBlock = keySize / 8 -11;
        }
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        int offSet = 0;
        byte[] buff;
        int i = 0;
        try {
            while (dataBytes.length > offSet){
                if(dataBytes.length-offSet > maxBlock){
                    buff = cipher.doFinal(dataBytes,offSet,maxBlock);
                }else {
                    buff = cipher.doFinal(dataBytes, offSet,dataBytes.length-offSet);
                }
                byteArrayOutputStream.write(buff,0,buff.length);
                i++;
                offSet = i*maxBlock;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        byte[] resultDatas = byteArrayOutputStream.toByteArray();
        try {
            byteArrayOutputStream.flush();
            byteArrayOutputStream.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return resultDatas;
    }




}