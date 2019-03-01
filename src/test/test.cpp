#include <iostream>
#include <fstream>

std::string readcontents(std::string const &filename)
{
    std::ifstream file(filename);
    if (!file)
        throw std::runtime_error(std::string("cannot open ") + filename);

    return std::string(std::istreambuf_iterator<char>(file),
                       std::istreambuf_iterator<char>());
}

// just for demo purposes
std::string in_dir_of(std::string const& filename, std::string const& other_filenme)
{
    const auto sep = "/";
    const auto last_slash = filename.rfind(sep);
    if (last_slash==std::string::npos) {
        return other_filenme;
    } else {
        return filename.substr(0, last_slash) + sep + other_filenme;
    }
}

int main(int argc, const char *argv[])
{
    try
    {
        std::cout << "starting " << argv[0] << std::endl;
        std::cout << "data: " << readcontents(in_dir_of(std::string(argv[0]),"data.txt")) << std::endl;
    }
    catch (std::exception &e)
    {
        std::cerr << "ERROR: " << e.what() << std::endl;
    }
}
