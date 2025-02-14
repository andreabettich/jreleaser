/*
 * SPDX-License-Identifier: Apache-2.0
 *
 * Copyright 2020-2021 The JReleaser authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.jreleaser.cli;

import picocli.CommandLine;

import java.util.Map;
import java.util.ResourceBundle;

/**
 * @author Andres Almiray
 * @since 0.8.0
 */
@CommandLine.Command(mixinStandardHelpOptions = true,
    versionProvider = Versions.class,
    resourceBundle = "org.jreleaser.cli.Messages")
abstract class BaseCommand {
    @CommandLine.Spec
    CommandLine.Model.CommandSpec spec;

    ResourceBundle bundle = ResourceBundle.getBundle("org.jreleaser.cli.Messages");

    @CommandLine.Option(names = "-D",
        paramLabel = "<key=value>",
        descriptionKey = "system-property",
        mapFallbackValue = "")
    void setProperty(Map<String, String> props) {
        props.forEach((k, v) -> System.setProperty(k, v));
    }
}
