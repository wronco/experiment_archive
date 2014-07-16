Url2png.config({

    # required
    :api_key      => ENV['URL2PNG_API_KEY'],
    :private_key  => ENV['URL2PNG_PRIVATE_KEY'],

    #optional
    :api_version  => 'v6',
    :api_url      => 'http://beta.url2png.com',
    :mode         => 'production',
    :default_size => '500x500'      

})