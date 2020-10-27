//
// Created by Cido on 2020/10/27.
//
#include <iostream>
#include "userAgent.h"


int main(int argc, char **argv) {
    // int opt;
    string str = "Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0)";
    UserAgent ua;
    Parse(ua, str, str.size());
    echo_ua(ua);
    cout << ua.os << endl;
    return 0;
}