#
# Cookbook Name:: cpu
# Author:: Jonathan Bogaty <jon@jonbogaty.com>
# Author:: Guilhem Lettron <guilhem.lettron@youscribe.com>
#
# Copyright 2015, Jonathan Bogaty
# Copyright 2012, Societe Publica.
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

(0..(node['cpu']['total'] - 1)).each do |i|
  execute "set governor for CPU #{i}" do
    command "cpufreq-set --cpu #{i} --governor #{node['cpu']['governor']}"
    action :run
    only_if "cpufreq-info --cpu #{i} --governors | grep #{node['cpu']['governor']}"
  end
end
