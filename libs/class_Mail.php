<?php

//mail('кому', 'тема письма', 'текст письма', 'Заголовки(headers)');

class Mail
{
    static string $subject = 'По умолчанию';
    static string $to = 'Jenyamelnik1986@i.ua';
    static string $from = 'admin@melnykyevhenii.school-php.com';
    static string $text = 'Какойто текст';
    static string $headers = '';

    static function send(): bool
    {
        self::$subject = '=?utf-8?b?' . base64_encode(self::$subject) . '?=';
        self::$headers = "Content-type: text/html; charset=\"utf-8\"\r\n";
        self::$headers .= "From: " . self::$from . "\r\n";
        self::$headers .= "MIME-Version: 1.0\r\n";
        self::$headers .= "Date: " . date('D, d M Y h:i:s O') . "\r\n";
        self::$headers .= "Precedence: bulk\r\n";

        return mail(self::$to, self::$subject, self::$text, self::$headers); // вернется true или false
    }


    /**
     * sending test mail
     */
    static function testSend()
    {
        if (mail(self::$to, 'English words', 'English words', self::$headers)) {
            echo 'the letter has been sent';
        } else {
            echo 'the letter has not been sent';
        }
        exit();
    }
}
