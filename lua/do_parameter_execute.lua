--
-- Licensed to the Apache Software Foundation (ASF) under one or more
-- contributor license agreements.  See the NOTICE file distributed with
-- this work for additional information regarding copyright ownership.
-- The ASF licenses this file to You under the Apache License, Version 2.0
-- (the "License"); you may not use this file except in compliance with
-- the License.  You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
--

local json = require("json")
local http = require("http")
function add_log(ctx, log)
     if not ctx then
         print(log)
        end

        if not ctx.inner_log then
              ctx.inner_log = ''
        end

        if log then
             ctx.inner_log = ctx.inner_log .. log .. '\n'
        end
end

@commonFunctions

function inner_function_@functionName(ctx, pre_value)
    @funcBody
end

function @functionName(ctx)
    if type(ctx) ~= 'table' then
        print('input ctx is not a table, can not execute function')
        return
    end

    local new_ctx = inner_function_@functionName(ctx, ctx.pre_value)
    if type(new_ctx) == "table" then
        if tostring(new_ctx) == tostring(ctx) then
           ctx.return_value = 'can not return ctx in function'
           return ctx
        end
    end

    ctx.return_value = new_ctx
    return ctx
end
