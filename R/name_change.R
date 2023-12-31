#' @title name_change
#' @description
#' This function allow to check if a vector of character strings, like column names of a data frame, has elements present in another vector (vector of reserved words or column names of another data frame before merging).
#' @param data1 Vector of character strings to check and modify.
#' @param data2 Reference vector of character strings.
#' @param added.string Single character string added at the end of the modified string in data1 if present in data2.
#' @returns
#' A list containing :
#' - $data: the modified data1 (in the same order as in the initial data1).
#' - $ini: the initial elements before modification. NULL if no modification.
#' - $post: the modified elements in the same order as in ini. NULL if no modification.
#' @details 
#' REQUIRED PACKAGES
#' 
#' cuteDev
#' 
#' 
#' REQUIRED FUNCTIONS FROM THE cute PACKAGE
#' 
#' arg_check()
#' @examples
#' obs1 <- c("A", "B", "C", "D") ; 
#' obs2 <- c("A", "C") ; 
#' name_change(obs1, obs2)
#' 
#' 
#' obs1 <- c("A", "B", "C", "C_modif1", "D") ; 
#' obs2 <- c("A", "A_modif1", "C") ; 
#' name_change(obs1, obs2) 
#' # the function checks that the new names are neither in obs1 nor in obs2 (increment the number after the added string)
#' @importFrom cuteDev arg_check
#' @export
name_change <- function(
        data1, 
        data2, 
        added.string = "_modif"
){
    
    # DEBUGGING
    # data1 = c("A", "B", "C", "D") ; data2 <- c("A", "C") ; added.string = "_modif" # for function debugging
    # package name
    package.name <- "cuteTool"
    # end package name
    # function name
    ini <- match.call(expand.dots = FALSE) # initial parameters (specific of arg_test())
    function.name <- paste0(as.list(match.call(expand.dots = FALSE))[[1]], "()") # function name with "()" paste, which split into a vector of three: c("::()", "package()", "function()") if "package::function()" is used.
    if(function.name[1] == "::()"){
        function.name <- function.name[3]
    }
    arg.names <- names(formals(fun = sys.function(sys.parent(n = 2)))) # names of all the arguments
    arg.user.setting <- as.list(match.call(expand.dots = FALSE))[-1] # list of the argument settings (excluding default values not provided by the user)
    # end function name
    # package checking
    # check of lib.path
    # end check of lib.path
    
    # check of the required function from the required packages
    .pack_and_function_check(
        fun = c(
            "cuteDev::arg_check"
        ),
        lib.path = NULL,
        external.function.name = function.name
    )
    # end check of the required function from the required packages
    # end package checking
    
    # argument primary checking
    # arg with no default values
    mandat.args <- c(
        "data1", 
        "data2"
    )
    tempo <- eval(parse(text = paste0("c(missing(", paste0(mandat.args, collapse = "),missing("), "))")))
    if(any(tempo)){ # normally no NA for missing() output
        tempo.cat <- paste0("ERROR IN ", function.name, " OF THE ", package.name, " PACKAGE: \nFOLLOWING ARGUMENT", ifelse(sum(tempo, na.rm = TRUE) > 1, "S HAVE", " HAS"), " NO DEFAULT VALUE AND REQUIRE ONE:\n", paste0(mandat.args, collapse = "\n"))
        stop(paste0("\n\n================\n\n", tempo.cat, "\n\n================\n\n"), call. = FALSE) # == in stop() to be able to add several messages between ==
    }
    # end arg with no default values
    
    # argument checking with arg_check()
    argum.check <- NULL #
    text.check <- NULL #
    checked.arg.names <- NULL # for function debbuging: used by r_debugging_tools
    ee <- expression(argum.check <- c(argum.check, tempo$problem) , text.check <- c(text.check, tempo$text) , checked.arg.names <- c(checked.arg.names, tempo$object.name))
    tempo <- cuteDev::arg_check(data = data1, class = "vector", mode = "character", fun.name = function.name) ; eval(ee)
    tempo <- cuteDev::arg_check(data = data2, class = "vector", mode = "character", fun.name = function.name) ; eval(ee)
    tempo <- cuteDev::arg_check(data = added.string, class = "vector", mode = "character", length = 1, fun.name = function.name) ; eval(ee)
    if( ! is.null(argum.check)){
        if(any(argum.check, na.rm = TRUE) == TRUE){
            stop(paste0("\n\n================\n\n", paste(text.check[argum.check], collapse = "\n"), "\n\n================\n\n"), call. = FALSE) #
        }
    }
    # end argument checking with arg_check()
    # check with r_debugging_tools
    # source("C:/Users/yhan/Documents/Git_projects/debugging_tools_for_r_dev/r_debugging_tools.R") ; eval(parse(text = str_basic_arg_check_dev)) ; eval(parse(text = str_arg_check_with_fun_check_dev)) # activate this line and use the function (with no arguments left as NULL) to check arguments status and if they have been checked using arg_check()
    # end check with r_debugging_tools
    # end argument primary checking
    
    # second round of checking and data preparation
    # management of NA arguments
    if( ! (all(class(arg.user.setting) == "list", na.rm = TRUE) & length(arg.user.setting) == 0)){
        tempo.arg <- names(arg.user.setting) # values provided by the user
        tempo.log <- suppressWarnings(sapply(lapply(lapply(tempo.arg, FUN = get, env = sys.nframe(), inherit = FALSE), FUN = is.na), FUN = any)) & lapply(lapply(tempo.arg, FUN = get, env = sys.nframe(), inherit = FALSE), FUN = length) == 1L # no argument provided by the user can be just NA
        if(any(tempo.log) == TRUE){ # normally no NA because is.na() used here
            tempo.cat <- paste0("ERROR IN ", function.name, " OF THE ", package.name, " PACKAGE: \n", ifelse(sum(tempo.log, na.rm = TRUE) > 1, "THESE ARGUMENTS", "THIS ARGUMENT"), " CANNOT JUST BE NA:", paste0(tempo.arg[tempo.log], collapse = "\n"))
            stop(paste0("\n\n================\n\n", tempo.cat, "\n\n================\n\n"), call. = FALSE) # == in stop() to be able to add several messages between ==
        }
    }
    # end management of NA arguments
    
    # management of NULL arguments
    tempo.arg <-c(
        "data1", 
        "data2", 
        "added.string"
    )
    tempo.log <- sapply(lapply(tempo.arg, FUN = get, env = sys.nframe(), inherit = FALSE), FUN = is.null)
    if(any(tempo.log) == TRUE){# normally no NA with is.null()
        tempo.cat <- paste0("ERROR IN ", function.name, " OF THE ", package.name, " PACKAGE:\n", ifelse(sum(tempo.log, na.rm = TRUE) > 1, "THESE ARGUMENTS\n", "THIS ARGUMENT\n"), paste0(tempo.arg[tempo.log], collapse = "\n"),"\nCANNOT BE NULL")
        stop(paste0("\n\n================\n\n", tempo.cat, "\n\n================\n\n"), call. = FALSE) # == in stop() to be able to add several messages between ==
    }
    # end management of NULL arguments
    
    # code that protects set.seed() in the global environment
    # end code that protects set.seed() in the global environment
    # warning initiation
    # end warning initiation
    # other checkings
    # end other checkings
    # reserved words (to avoid bugs)
    # end reserved words (to avoid bugs)
    # end second round of checking and data preparation
    
    
    # package checking
    # end package checking
    
    # main code
    ini <- NULL
    post <- NULL
    if(any(data1 %in% data2)){
        tempo.names <- data1[data1 %in% data2]
        ini <- NULL
        post <- NULL
        for(i2 in 1:length(tempo.names)){
            count <- 0
            tempo <- tempo.names[i2]
            while(any(tempo %in% data2) | any(tempo %in% data1)){
                count <- count + 1
                tempo <- paste0(tempo.names[i2], "_modif", count)
            }
            data1[data1 %in% tempo.names[i2]] <- paste0(tempo.names[i2], "_modif", count)
            if(count != 0){
                ini <- c(ini, tempo.names[i2])
                post <- c(post, paste0(tempo.names[i2], "_modif", count))
            }
        }
        data <- data1
    }else{
        data <- data1
    }
    # output
    # warning output
    # end warning output
    output <- list(data = data, ini = ini, post = post)
    return(output)
    # end output
    # end main code
}

