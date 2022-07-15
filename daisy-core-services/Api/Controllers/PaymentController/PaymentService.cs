using BuyTogether.Domain.Services;
using System;
using System.Security.Cryptography;
using System.Text;
using Newtonsoft.Json.Linq;
using System.IO;
using System.Net;

namespace Api.Controllers.PaymentService {
 public class MoMoRequestDto : MoMoDepositDto {
        public string PartnerCode {
            get; set;
        }
        public string AccessKey {
            get; set;
        }
        public string RequestType {
            get; set;
        }
        public string lang {
            get; set;
        }
        public new string RedirectUrl {
            get; set;
        }
        public string IpnUrl {
            get; set;
        }
        public string stringfyJson() {
            return "accessKey=" + AccessKey +
             "&amount=" + Amount +
             "&extraData=" + ExtraData +
             "&ipnUrl=" + IpnUrl +
             "&orderId=" + OrderId +
             "&orderInfo=" + OrderInfo +
             "&partnerCode=" + PartnerCode +
             "&redirectUrl=" + RedirectUrl +
             "&requestId=" + RequestId +
             "&requestType=" + RequestType
             ;
        }
    }

  public class DepositoryDto {
        public long Amount {
            get; set;
        }
        public string RedirectUrl {
            get; set;
        }
    }

    public class MoMoDepositDto {

        public string RequestId {
            get; set;
        }
        public long Amount {
            get; set;
        }
        public string OrderId {
            get; set;
        }
        public string OrderInfo {
            get; set;
        }

        public string ExtraData {
            get; set;
        }

        public string Signature {
            get; set;
        }
        public string RedirectUrl {
            get; set;
        }
    }



    public class MoMoCallBackDto {
        public string PartnerCode {
            get; set;
        }

        public string OrderId {
            get; set;
        }
        public string RequestId {
            get; set;
        }
        public long Amount {
            get; set;
        }
        public string OrderInfo {
            get; set;
        }
        public string OrderType {
            get; set;
        }
        public long TransId {
            get; set;
        }
        public string ResultCode {
            get; set;
        }
        public string Message {
            get; set;
        }
        public string PayType {
            get; set;
        }
        public long ResponseTime {
            get; set;
        }
        public string ExtraData {
            get; set;
        }
        public string Signature {
            get; set;
        }
    }

    public class PaymentService : IPaymentService {
        private readonly IConfig _config;
        public PaymentService(IConfig Config) {
            this._config = Config;
        }
// lay tu momo
        private readonly string MOMO_SECRET_CONFIG_KEY = "MOMO";
        private readonly string MOMO_ACCESSKEY_CONFIG_KEY = "MOMO";
        private readonly string MOMO_PARTNER_CODE_CONFIG_KEY = "MOMO";
    // call back to server 
    // vd: hello.com/api/payment/callback
        private readonly string SERVER_URL_CONFIG_KEY = "SERVER_URL";


        private string SignSHA256(string message, string key) {
            byte[] keyByte = Encoding.UTF8.GetBytes(key);
            byte[] messageBytes = Encoding.UTF8.GetBytes(message);
            using (var hmacsha256 = new HMACSHA256(keyByte)) {
                byte[] hashmessage = hmacsha256.ComputeHash(messageBytes);
                string hex = BitConverter.ToString(hashmessage);
                hex = hex.Replace("-", "").ToLower();
                return hex;

            }
        }
        private string SendMoMoRequest(string postJsonString) {

            try {
                var endpoint = this._config.GetEnvByKey(Constant.MOMO_ENDPOINT_CONFIG_KEY);
                HttpWebRequest httpWReq = (HttpWebRequest) WebRequest.Create(endpoint);

                var postData = postJsonString;

                var data = Encoding.UTF8.GetBytes(postData);

                httpWReq.ProtocolVersion = HttpVersion.Version11;
                httpWReq.Method = "POST";
                httpWReq.ContentType = "application/json";

                httpWReq.ContentLength = data.Length;
                httpWReq.ReadWriteTimeout = 30000;
                httpWReq.Timeout = 15000;
                Stream stream = httpWReq.GetRequestStream();
                stream.Write(data, 0, data.Length);
                stream.Close();

                HttpWebResponse response = (HttpWebResponse) httpWReq.GetResponse();

                string jsonresponse = "";

                using (var reader = new StreamReader(response.GetResponseStream())) {

                    string temp = null;
                    while ((temp = reader.ReadLine()) != null) {
                        jsonresponse += temp;
                    }
                }


                //todo parse it
                return jsonresponse;
                //return new MomoResponse(mtid, jsonresponse);

            }
            catch (WebException e) {
                return e.Message;
            }
        }
        private static RNGCryptoServiceProvider rngCsp = new RNGCryptoServiceProvider();
        public string MonoDeposit(MoMoDepositDto moMoPaymentDto) {
            var moMoRequestDto = new MoMoRequestDto();
            var secretKey = this.MOMO_SECRET_CONFIG_KEY;
            var accessKey = this.MOMO_ACCESSKEY_CONFIG_KEY;
            moMoRequestDto.RequestId = moMoPaymentDto.RequestId;
            moMoRequestDto.Amount = moMoPaymentDto.Amount;
            moMoRequestDto.OrderId = moMoPaymentDto.OrderId;
            moMoRequestDto.OrderInfo = "Nạp Tiền Daisy";
            moMoRequestDto.ExtraData = "";
            moMoRequestDto.Signature = "";
            moMoRequestDto.AccessKey = accessKey;
            moMoRequestDto.PartnerCode = (this.MOMO_PARTNER_CODE_CONFIG_KEY);
            moMoRequestDto.lang = "en";
            moMoRequestDto.RequestType = "captureWallet";
            moMoRequestDto.RedirectUrl = moMoPaymentDto.RedirectUrl;
            moMoRequestDto.IpnUrl = (this.SERVER_URL_CONFIG_KEY)
            string rawHash = "accessKey=" + accessKey +
              "&amount=" + moMoRequestDto.Amount +
              "&extraData=" + moMoRequestDto.ExtraData +
              "&ipnUrl=" + moMoRequestDto.IpnUrl +
              "&orderId=" + moMoRequestDto.OrderId +
              "&orderInfo=" + moMoRequestDto.OrderInfo +
              "&partnerCode=" + moMoRequestDto.PartnerCode +
              "&redirectUrl=" + moMoRequestDto.RedirectUrl +
              "&requestId=" + moMoRequestDto.RequestId +
              "&requestType=" + moMoRequestDto.RequestType
              ;
            string signature = this.SignSHA256(rawHash, secretKey);

            JObject message = new JObject
            {
                { "partnerCode", moMoRequestDto.PartnerCode },
                { "partnerName", "Buyehter" },
                { "storeId", "Buyehter" },
                { "requestId", moMoRequestDto.RequestId },
                { "amount", moMoRequestDto.Amount },
                { "orderId", moMoRequestDto.OrderId },
                { "orderInfo", moMoRequestDto.OrderInfo },
                { "redirectUrl", moMoRequestDto.RedirectUrl },
                { "ipnUrl", moMoRequestDto.IpnUrl },
                { "lang", moMoRequestDto.lang },
                { "extraData", moMoRequestDto.ExtraData },
                { "requestType", moMoRequestDto.RequestType },
                { "signature", signature }

            };
            string responseFromMomo = this.SendMoMoRequest(message.ToString());
            JObject jmessage = JObject.Parse(responseFromMomo);
            return jmessage.GetValue("payUrl").ToString();
        }
    }
}
