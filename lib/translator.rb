require "yaml"

def load_library path
  emoticon_hash = YAML.load_file(path)
  emo_splitted = {
    "get_meaning" => Hash.new,
    "get_emoticon" => Hash.new
  }
  emoticon_hash.each do |name, array|
    emo_splitted["get_meaning"][array[1]] = name
    emo_splitted["get_emoticon"][array[0]] = array[1]
  end
  emo_splitted
end


def get_japanese_emoticon(path, emoticon)
  emo_splitted = load_library(path)
  return "Sorry, that emoticon was not found" if !emo_splitted["get_emoticon"][emoticon]
  emo_splitted["get_emoticon"][emoticon]
end

def get_english_meaning(path, emoticon)
  emo_splitted = load_library(path)
  return "Sorry, that emoticon was not found" if !emo_splitted["get_meaning"][emoticon]
  emo_splitted["get_meaning"][emoticon]
end
