package org.jasig.cas.ticket;


import org.jasig.cas.ticket.TicketException;

/**
 * Generic Bad Credentials Exception. This can be thrown when the system knows
 * the credentials are not valid specificially because they are bad. Subclasses
 * can be specific to a certain type of Credentials
 * (BadUsernamePassowrdCredentials).
 *
 * @author Scott Battaglia
 * @version $Revision$ $Date$
 * @since 3.0
 */
public class BadImgVerifyCodeAuthenticationException extends TicketException
{

    /**
     * Static instance of class to prevent cost incurred by creating new
     * instance.
     */
    public static final BadImgVerifyCodeAuthenticationException ERROR = new BadImgVerifyCodeAuthenticationException();

    /** UID for serializable objects. */
    private static final long serialVersionUID = 3256719585087797044L;

    /**
     * Default constructor that does not allow the chaining of exceptions and
     * uses the default code as the error code for this exception.
     */
    private static final String CODE = "error.authentication.imgverifycode.bad";

    /**
     * Default constructor that does not allow the chaining of exceptions and
     * uses the default code as the error code for this exception.
     */
    public BadImgVerifyCodeAuthenticationException()
    {
        super(CODE);
    }

    /**
     * Constructor to allow for the chaining of exceptions. Constructor defaults
     * to default code.
     *
     * @param throwable the chainable exception.
     */
    public BadImgVerifyCodeAuthenticationException(final Throwable throwable)
    {
        super(CODE, throwable);
    }

    /**
     * Constructor method to allow for providing a custom code to associate with
     * this exception.
     *
     * @param code the code to use.
     */
    public BadImgVerifyCodeAuthenticationException(final String code)
    {
        super(code);
    }

    /**
     * Constructor to allow for the chaining of exceptions and use of a
     * non-default code.
     *
     * @param code the user-specified code.
     * @param throwable the chainable exception.
     */
    public BadImgVerifyCodeAuthenticationException(final String code,
                                                   final Throwable throwable)
    {
        super(code, throwable);
    }
}