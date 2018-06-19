/**
 * @file <+FILENAME+>
 * @brief <+CURSOR+>
 * @author arwtyxouymz
 * @date <+DATE+>
 */

#include "<+FILENAME+>.hpp"

/**
 * @brief Constructor
 */
<+FILENAME+>::<+FILENAME+>() = default;

/**
 * @brief Destructor
 */
<+FILENAME+>::~<+FILENAME+>() = default;


/**
 * @brief Copy Constructor
 *
 * @param other Other <+FILENAME+> class object
 */
<+FILENAME+>::<+FILENAME+>(const <+FILENAME+>& other)
{
    *this = other;
}

/**
 * @brief Overload assign operator
 *
 * @param other Other <+FILENAME+> class object
 *
 * @return the reference of this
 */
<+FILENAME+>& <+FILENAME+>::operator=(const <+FILENAME+>& other)
{
    // no self-assignment
    if (this != &other)
    {
        // deep copy
    }
    return *this;
}

