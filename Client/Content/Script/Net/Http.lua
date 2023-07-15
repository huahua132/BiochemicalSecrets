local http = require "socket.http"
local ltn12 = require "ltn12"
local rapidjson = require "rapidjson"


Http = Object({})

function Http:Create()
    self.user = "none"
    self.jwt = "none"
end

function Http:SetJwt(user, token)
    self.user = user
    self.jwt = token
end

function Http:Get(url)
    local respbody = {}
    local body, code, headers, status = http.request {
        method = "GET",
        url = url,
        headers = {
            ["Accept"] = "*/*",
            ["Accept-Encoding"] = "gzip, deflate",
            ["Accept-Language"] = "en-us",
            ["Jwt"] = self.jwt,
            ["User"] =  self.user,
        },
        sink = ltn12.sink.table(respbody)
    }
    return respbody[1]
end

function Http:Post(url, data)
    local respbody = {}
    local body, code, headers, status = http.request {
        method = "POST",
        url = url,
        source = ltn12.source.string(data),
        headers = {
            ["Accept"] = "*/*",
            ["Accept-Encoding"] = "gzip, deflate",
            ["Accept-Language"] = "en-us",
            ["Content-Length"] = string.len(data),
            ["Jwt"] = self.jwt,
            ["User"] =  self.user,
        },
        sink = ltn12.sink.table(respbody)
    }
    return respbody[1]
end

-- string to json table
function Http:PostJson(url, json_data)
    local data = rapidjson.encode(json_data)
    local body = self:Post(url, data)
    return rapidjson.decode(body)
end


function Http:GetJson(url)
    local body = self:Get(url)
    return rapidjson.decode(body)
end