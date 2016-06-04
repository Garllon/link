LIB_PATH = File.dirname(__FILE__)
$LOAD_PATH.unshift LIB_PATH

require 'gosu'
require 'link/window'
require 'link/player'

module Link
  VERSION = '0.0.1.alpha'
end

window = Link::Window.new
window.show
