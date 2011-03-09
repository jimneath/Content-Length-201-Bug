require ::File.expand_path('../config/environment',  __FILE__)
require 'content_length_fix'

use Nginx::ContentLengthFix

run ContentLength::Application
