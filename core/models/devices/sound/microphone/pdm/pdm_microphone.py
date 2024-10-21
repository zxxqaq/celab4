#
# Copyright (C) 2020 GreenWaves Technologies, SAS, ETH Zurich and University of Bologna
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

import gvsoc.systree
import regmap.regmap
import regmap.regmap_md
import regmap.regmap_c_header


class Microphone_pdm(gvsoc.systree.Component):

    def __init__(self, parent, name, slot = None,  generated_freq = 1000):
        super(Microphone_pdm, self).__init__(parent, name)

        self.set_component('devices.sound.microphone.pdm.pdm_microphone')

        self.add_property('slot', slot)
        self.add_property('generated_freq', generated_freq)

    def i_AUDIO(self) -> gvsoc.systree.SlaveItf:
        return gvsoc.systree.SlaveItf(self, 'audio_input', signature='audio')

    def o_AUDIO(self, itf: gvsoc.systree.SlaveItf):
        self.itf_bind('audio_output', itf, signature='audio')
