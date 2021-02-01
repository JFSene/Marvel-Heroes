# Marvel-Heroes

## A simple POC made in Clean Swift and consuming the Marvel API

<p> The App consist of two pages being:

 - Heroes List: Brings a list of every Marvel character with a Thumbnail, name and their initial Bio.
 - Hero Details: Shows a bigger image of the selected hero and their complete Bio

### Only  3rd party tool used on the project was Kingfisher using Swift Package Manager to download the images.
- https://github.com/onevcat/Kingfisher

### To run the Project you need:
- Clone the project
- Go to Marvel Developers and get the Public and Secret Keys
- On the project go to `APIClient.swift`and replace the keys with your own
- Finally just run the project and enjoy

```//ADD Keys Here
enum Keys: String {
    case publicKey = "PUBLIC KEY HERE"
    case secretKey = "SECRET KEY HERE"
}
