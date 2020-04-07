/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.ruoyi.sms.facade;


import com.alibaba.dubbo.config.annotation.Service;
import com.google.common.base.Function;
import com.google.common.collect.Lists;
import org.checkerframework.checker.nullness.qual.Nullable;

import java.util.List;


/**
 * Default {@link DemoFacade}
 *
 * @author <a href="mailto:mercyblitz@gmail.com">Mercy</a>
 * @see DemoFacade
 * @since 1.0.0
 */
@Service(
        version = "1.0.0",
        timeout = 15000
)
public class DefaultDemoFacadeImpl implements DemoFacade {

    @Override
    public String sayHello(String name) {
        return "Hello, " + name + " (from Spring Boot)";
    }

    @Override
    public List<String> abs() {


        List<String> transform = Lists.transform(Lists.newArrayList(1), new Function<Integer, String>() {
            @Nullable
            @Override
            public String apply(@Nullable Integer input) {
                return input.toString();
            }
        });
        return transform;
    }
}