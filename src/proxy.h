// Copyright 2014 Toggl Desktop developers.

#ifndef SRC_PROXY_H_
#define SRC_PROXY_H_

#include <string>

#include "./types.h"

#include "Poco/Types.h"

namespace kopsik {

  class Proxy {
   public:
    Proxy() :
      host(""),
      port(0),
      username(""),
      password("") {}

    bool IsConfigured() const { return !host.empty() && port; }
    bool HasCredentials() const {
      return !username.empty() && !password.empty(); }

    std::string host;
    Poco::UInt16 port;
    std::string username;
    std::string password;
  };

}  // namespace kopsik

#endif  // SRC_PROXY_H_
