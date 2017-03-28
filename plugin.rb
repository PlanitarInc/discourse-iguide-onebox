#!/bin/env ruby
# encoding: utf-8
# name: youriguide.com Onebox
# version: 0.1
# authors: planitar


register_css <<CSS

.youriguide-embed {
    position: relative;
    height: 400px;
    border: 1px solid #ddd;
    border-radius: 3px;
}

.youriguide-container {
    position: absolute;
    top: 33px;
    bottom: 1px;
    left: 1px;
    right: 1px;
}

.youriguide-frame {
    border: none;
    width: 100%;
    height: 100%;
}
CSS


Onebox = Onebox
class Onebox::Engine::youriguideOnebox
    include Onebox::Engine

    def self.priority
        0
    end

    REGEX = /^https?:\/\/(www\.)?youriguide\.com\/([0-9a-z\-]+)$/
    
    REGEX = /^https?:\/\/pseuco\.com\/\#(?:\/sku\/\w+\/\w+)?\/edit\/remote\/([0-9a-z\-]+)$/
    
    /^(https?:)?\/\/(www\.)?youriguide\.com\/.+/i

    matches_regexp REGEX

    def id
        @url.match(REGEX)[1]
    end

    def url
        "https://youriguide.com/{id}"
    end

    def to_html
        <<HTML
        <div class="youriguide-embed">
            <div class="youriguide-container">
                <iframe class="youriguide-frame" src="//youriguide.com/{id}"></iframe>
            </div>
        </div>
HTML
    end
end
