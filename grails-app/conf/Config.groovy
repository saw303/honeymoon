// locations to search for config files that get merged into the main config
// config files can either be Java properties files or ConfigSlurper scripts

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if(System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.mime.types = [html: ['text/html', 'application/xhtml+xml'],
        xml: ['text/xml', 'application/xml'],
        text: 'text/plain',
        js: 'text/javascript',
        rss: 'application/rss+xml',
        atom: 'application/atom+xml',
        css: 'text/css',
        csv: 'text/csv',
        all: '*/*',
        json: ['application/json', 'text/json'],
        form: 'application/x-www-form-urlencoded',
        multipartForm: 'multipart/form-data'
]
// The default codec used to encode data with ${}
grails.views.default.codec = "none" // none, html, base64
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = true
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// whether to install the java.util.logging bridge for sl4j. Disable fo AppEngine!
grails.logging.jul.usebridge = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []

// set per-environment serverURL stem for creating absolute links
environments {
  production {
    grails.serverURL = "http://www.sabineundmarcel.ch/${appName}"

    grails {
      mail {
        host = "smtp.gmail.com"
        port = 465
        username = System.properties['mats.mail.username']
        password = System.properties['mats.mail.password']
        props = ["mail.smtp.auth": "true",
                "mail.smtp.socketFactory.port": "465",
                "mail.smtp.socketFactory.class": "javax.net.ssl.SSLSocketFactory",
                "mail.smtp.socketFactory.fallback": "false"]
      }
    }
  }
  development {
    grails.serverURL = "http://localhost:8080/${appName}"

    grails {
      mail {
        host = "smtp.gmail.com"
        port = 465
        username = System.properties['mats.mail.username']
        password = System.properties['mats.mail.password']
        props = ["mail.smtp.auth": "true",
                "mail.smtp.socketFactory.port": "465",
                "mail.smtp.socketFactory.class": "javax.net.ssl.SSLSocketFactory",
                "mail.smtp.socketFactory.fallback": "false"]
      }
    }
  }
  test {
    grails.serverURL = "http://localhost:8080/${appName}"

    grails {
      mail {
        host = "smtp.gmail.com"
        port = 465
        username = System.properties['mats.mail.username']
        password = System.properties['mats.mail.password']
        props = ["mail.smtp.auth": "true",
                "mail.smtp.socketFactory.port": "465",
                "mail.smtp.socketFactory.class": "javax.net.ssl.SSLSocketFactory",
                "mail.smtp.socketFactory.fallback": "false"]
      }
    }
  }

}

// log4j configuration
log4j = {
  // Example of changing the log pattern for the default console
  // appender:
  //
  appenders {
    console name: 'stdout', layout: pattern(conversionPattern: '%c{2} %m%n')
  }

  error 'org.codehaus.groovy.grails.web.servlet',
          'org.codehaus.groovy.grails.web.pages', //  GSP
          'org.codehaus.groovy.grails.web.sitemesh', //  layouts
          'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
          'org.codehaus.groovy.grails.web.mapping', // URL mapping
          'org.codehaus.groovy.grails.commons', // core / classloading
          'org.codehaus.groovy.grails.plugins', // plugins
          'org.codehaus.groovy.grails.orm.hibernate', // hibernate integration
          'org.springframework',
          'org.hibernate',
          'net.sf.ehcache.hibernate'

  warn 'org.mortbay.log'
}

grails.mail.default.from = 'saw@silviowangler.ch'
honeymoon.bride = 'sabine'
honeymoon.groom = 'maese'
honeymoon.bestman = 'michael'
honeymoon.bridesmaid = 'martina'
honeymoon.admin = 'saw'
def appHome = "${System.properties['user.home']}/.honeymoon"

honeymoon.app.dir = appHome
honeymoon.upload.dir = "$appHome/files"