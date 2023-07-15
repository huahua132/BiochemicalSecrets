-----------------------------------------------------------------------------
-- Author: i0gan
-- Email : l418894113@gmail.com
-- Date  : 2023-01-02
-- Description: 客户端 GUID
-----------------------------------------------------------------------------
-- 生成 Guid


Guid = Object({})


function Guid:Create(h, d)
    self.nHead64 = 0
    self.nData64 = 0;
    if type(h) == "string" then
        self:ParseFromString(h)
        return
    end
    
    self.nHead64 = h
    self.nData64 = d
end

function Guid:ParseFromString(str)
    local pos = string.find(str, "-")
    if pos == nil then
        print("Guid parse fialed!")
        return
    end
    local hs = string.sub(str, 1, pos - 1)
    local ds = string.sub(str, pos + 1, #str)
    self.nHead64 = tonumber(hs)
    self.nData64 = tonumber(ds)
end

function Guid:ToString()
    return tostring(self.nHead64) .. "-" .. tostring(self.nData64)
end

function Guid:ToIdent()
    return {
        svrid = self.nHead64,
        index = self.nData64
    }
end
