class UserMailer < ApplicationMailer
    def confirmation_email(user)
        # url_for is a Rails helper that generates a URL for a given route
        # In this case, we're generating a URL for the confirm action in the users controller
        #
        # The arguments provided are:
        #   controller: 'users' - the controller to use
        #   action: 'confirm' - the action to use
        #   token: @user.confirmation_token - the token to pass as a query parameter
        #   only_path: false - this tells Rails to generate a full URL, including the host and port
        #
        # The url_for method interface is: url_for(options = {})
        #
        # The options hash can contain the following
        #   :controller - the controller to use
        #   :action - the action to use
        #   :id - the id of the resource
        #   :host - the host to use
        #   :port - the port to use
        #   :protocol - the protocol to use
        #   :subdomain - the subdomain to use
        #   :domain - the domain to use
        #   :tld_length - the length of the top-level domain
        #   :trailing_slash - whether to include a trailing slash
        #   :anchor - the anchor to use
        #   :script_name - the script name to use
        #   :only_path - whether to generate a full URL or just the path
        #
        # The list can be found at: https://api.rubyonrails.org/v6.1.3.1/classes/ActionDispatch/Routing/UrlFor.html#method-i-url_for
        confirmation_link = url_for(
            controller: 'users',
            action: 'confirm', 
            token: user.confirmation_token,
            only_path: false,
        )

        # The mail method is a method provided by the ApplicationMailer class
        # It takes a block that defines the email content
        # The block is passed a format object that defines the format of the email
        # In this case, we're defining a text format email
        #
        # The mail method interface is: mail(headers = {}, &block)
        #
        # The headers hash can contain the following
        #   :to - the recipient of the email
        #   :from - the sender of the email
        #   :cc - the cc recipients of the email
        #   :bcc - the bcc recipients of the email
        #   :reply_to - the reply-to address of the email
        #   :subject - the subject of the email
        #   :template_name - the name of the template to use
        #   :template_path - the path to the template
        #   :content_type - the content type of the email
        #   :charset - the character set of the email
        #   :parts_order - the order of the parts in the email
        #   :delivery_method - the delivery method to use
        #   :template_name - the name of the template to use
        #   :template_path - the path to the template
        #   :template_name - the name of the template to use
        #   :template_path - the path to the template
        #   :template_name - the name of the template to use
        #   :template_path - the path to the template
        #
        # The list can be found at: https://api.rubyonrails.org/v6.1.3.1/classes/ActionMailer/Base.html#method-i-mail
        mail(
            from: ENV["GMAIL_USERNAME"],
            to: user.email,
            subject: 'Email Confirmation') do |format|
                format.text { 
                    render plain: "Welcome, #{user.username}!\nClick the link below to confirm your email:\n#{confirmation_link}"
                }
            end
        
        puts "Confirmation link: #{confirmation_link}"
    end

    def password_reset_email(user)
        password_reset_link = url_for(
            controller: 'users',
            action: 'reset_password', 
            password_reset_token: user.password_reset_token,
            only_path: false,
        )

        mail(
            from: ENV["GMAIL_USERNAME"],
            to: user.email,
            subject: 'Password Reset') do |format|
                format.text { 
                    render plain: "Hello, #{user.username}!\nClick the link below to reset your password:\n#{password_reset_link}"
                }
            end
        
        puts "Password reset link: #{password_reset_link}"
    end
end
