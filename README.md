# Dawn

wget -O Dawn.sh https://raw.githubusercontent.com/MatthewBosch/Dawn/main/Dawn.sh && sed -i 's/\r$//' Dawn.sh && chmod +x Dawn.sh && ./Dawn.sh

wget --no-cache -O Dawn.sh https://raw.githubusercontent.com/MatthewBosch/Dawn/main/Dawn.sh && sed -i 's/\r$//' Dawn.sh && chmod +x Dawn.sh && ./Dawn.sh



cd Dawn-main
nano main.go
把main.go的58–68行改成以下内容

原内容如下：

client := resty.New().SetProxy(proxyURL).
                SetTLSClientConfig(&tls.Config{InsecureSkipVerify: true}).
                SetHeader("content-type", "application/json").
                SetHeader("origin", "chrome-extension://fpdkjdnhkakefebpekbdhillbhonfjj>
                SetHeader("accept", "*/*").
                SetHeader("accept-language", "en-US,en;q=0.9").
                SetHeader("priority", "u=1, i").
                SetHeader("sec-fetch-dest", "empty").
                SetHeader("sec-fetch-mode", "cors").
                SetHeader("sec-fetch-site", "cross-site").
                SetHeader("user-agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7> AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36")
替换成：

client := resty.New().
 SetTLSClientConfig(&tls.Config{InsecureSkipVerify: true}).
 SetHeader("content-type", "application/json").
 SetHeader("origin", "chrome-extension://fpdkjdnhkakefebpekbdhillbhonfjjp").
 SetHeader("accept", "*/*").
 SetHeader("accept-language", "en-US,en;q=0.9").
 SetHeader("priority", "u=1, i").
 SetHeader("sec-fetch-dest", "empty").
 SetHeader("sec-fetch-mode", "cors").
 SetHeader("sec-fetch-site", "cross-site").
 SetHeader("user-agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36")
if proxyURL != "" {
 client.SetProxy(proxyURL)
}
