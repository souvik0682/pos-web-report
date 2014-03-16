//====================================================================================
// NAME		 : ISBSecurity.cs
// PURPOSE	 : Represents an utility class for managing password.
// AUTHORS	 : Amit Kumar Chandra
// COPYRIGHT : Copyright © 2013 CES Technologies Pvt. Ltd.
// COMMENTS	 : 
//====================================================================================
//
// $Log: ISBSecurity.cs,v $
//
//====================================================================================
// This document contains confidential and proprietary information of CES Technologies
// Pvt. Ltd. and may be protected by patents, trademarks, copyrights, trade secrets, 
// and/or other relevant state, federal, and foreign laws. Its receipt or possession
// does not convey any rights to reproduce, disclose its contents, or to manufacture,
// use or sell anything contained herein. Forwarding, reproducing, disclosing or
// using without specific written authorisation of CES Technologies Pvt. Ltd. is 
// strictly forbidden.
// © 2013 CES Technologies Pvt. Ltd. All rights reserved
//====================================================================================
using System;
using System.Collections.Generic;
using System.IO;
using System.Security.Cryptography;
using System.Text;

namespace POSWebRpt.Utilities.Cryptography
{
    /// <summary>
    /// Represents the class for managing password.
    /// </summary>
    /// <createdby>Amit Kumar Chandra</createdby>
    /// <createddate>11/06/2012</createddate>
    public static class ISBSecurity
    {
        private static Byte[] KEY_64 = { 1, 2, 3, 4, 5, 6, 7, 8 };
        private static Byte[] IV_64 = { 8, 7, 6, 5, 4, 3, 2, 1 };

        /// <summary>
        /// Encrypt password using DES algorithm.
        /// </summary>
        /// <param name="password">Password to be encrypted.</param>
        /// <returns>The <see cref="System.String"/> object containing the encrypted password.</returns>
        /// <createdby>Amit Kumar Chandra</createdby>
        /// <createddate>11/06/2012</createddate>
        public static string EncryptPassword(string password)
        {
            string encryptedString = string.Empty;

            DESCryptoServiceProvider cryptoProvider = new DESCryptoServiceProvider();

            using (MemoryStream ms = new MemoryStream())
            {
                using (CryptoStream cs = new CryptoStream(ms, cryptoProvider.CreateEncryptor(KEY_64, IV_64), CryptoStreamMode.Write))
                {
                    using (StreamWriter sw = new StreamWriter(cs))
                    {
                        sw.Write(password);
                        sw.Flush();
                        cs.FlushFinalBlock();
                        ms.Flush();
                        encryptedString = Convert.ToBase64String(ms.GetBuffer(), 0, Convert.ToInt32(ms.Length));
                    }
                }
            }

            return encryptedString;
        }

        /// <summary>
        /// Decrypt password using DES algorithm.
        /// </summary>
        /// <param name="encryptedString">Encrypted password.</param>
        /// <returns>The <see cref="System.String"/> object containing the decrypted password.</returns>
        /// <createdby>Amit Kumar Chandra</createdby>
        /// <createddate>11/06/2012</createddate>
        public static string DecryptPassword(string encryptedString)
        {
            string password = string.Empty;

            using (DESCryptoServiceProvider cryptoProvider = new DESCryptoServiceProvider())
            {
                Byte[] buffer = Convert.FromBase64String(encryptedString);

                using (MemoryStream ms = new MemoryStream(buffer))
                {
                    using (CryptoStream cs = new CryptoStream(ms, cryptoProvider.CreateDecryptor(KEY_64, IV_64), CryptoStreamMode.Read))
                    {
                        using (StreamReader sr = new StreamReader(cs))
                        {
                            password = sr.ReadToEnd();
                        }
                    }
                }
            }

            return password;
        }

        /// <summary>
        /// Generates password using RNG (Random Number Generator) algorithm.
        /// </summary>
        /// <param name="length">Length of the password.</param>
        /// <param name="numberOfNonAlphanumericCharacters">Number Of non alphanumeric characters.</param>
        /// <returns>The <see cref="System.String"/> object containing the newly generated password.</returns>
        /// <createdby>Amit Kumar Chandra</createdby>
        /// <createddate>11/06/2012</createddate>
        public static string GeneratePassword(int length, int numberOfNonAlphanumericCharacters)
        {
            // Make sure length and numberOfNonAlphanumericCharacters are valid....
            if (((length < 1) || (length > 128)))
            {
                throw new ArgumentException("Incorrect Password Length");
            }

            if (((numberOfNonAlphanumericCharacters > length) || (numberOfNonAlphanumericCharacters < 0)))
            {
                throw new ArgumentException("Minimum required non alphanumeric characters.");
            }

            while (true)
            {
                int i;
                int nonANcount = 0;

                byte[] buffer = new byte[length];
                char[] chPassword = new char[length];
                char[] chPunctuations = "!@@$%^^*()_-+=[{]};:>|./?".ToCharArray();
                // Get a cryptographically strong series of bytes
                RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
                rng.GetBytes(buffer);

                for (i = 0; (i <= (length - 1)); i++)
                {
                    // Convert each byte into its representative character
                    int rndChr = (buffer[i] % 87);

                    if ((rndChr < 10))
                    {
                        chPassword[i] = Convert.ToChar(Convert.ToUInt16((48 + rndChr)));
                    }
                    else if ((rndChr < 36))
                    {
                        chPassword[i] = Convert.ToChar(Convert.ToUInt16(((65 + rndChr) - 10)));
                    }
                    else if ((rndChr < 62))
                    {
                        chPassword[i] = Convert.ToChar(Convert.ToUInt16(((97 + rndChr) - 36)));
                    }
                    else
                    {
                        chPassword[i] = chPunctuations[(rndChr - 62)];
                        nonANcount++;
                    }
                }

                if ((nonANcount < numberOfNonAlphanumericCharacters))
                {
                    Random rndNumber = new Random();

                    for (i = 0; (i <= ((numberOfNonAlphanumericCharacters - nonANcount) - 1)); i++)
                    {
                        int passwordPos = rndNumber.Next(0, length); ;

                        for (
                            ; !char.IsLetterOrDigit(chPassword[passwordPos]);
                            )
                        {
                            passwordPos = rndNumber.Next(0, length);
                        }

                        chPassword[passwordPos] = chPunctuations[rndNumber.Next(0, chPunctuations.Length)];
                    }
                }

                return new string(chPassword);
            }
        }
    }
}
