<?php

	/**
	 * This program is free software; you can redistribute it and/or modify
    * it under the terms of the GNU General Public License as published by
    * the Free Software Foundation; either version 2 of the License, or
    * (at your option) any later version.
    *
    * This program is distributed in the hope that it will be useful,
    * but WITHOUT ANY WARRANTY; without even the implied warranty of
    * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    * GNU General Public License for more details.
	 *
    * You should have received a copy of the GNU General Public License
    * along with this program; if not, write to the Free Software
    * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
	 *
 	 * D O  N O T  R E M O V E  T H E S E  C O M M E N T S
	 *
	 * @Package Form Obfuscator
	 * @Author  Hamid Alipour, http://blog.code-head.com/ http://www.hamidof.com/
	 */

	class Form_Obfuscator {

		/**
		 *	Form fields to be obfuscated
		 *
		 *	@var array
		 */
		private $fields;

		/**
		 *	Length of generated field, chars
		 *
		 *	@var int
		 */
		private $field_length;

		/**
		 *	List of already generated fields
		 *
		 *	@var array
		 */
		private $generated_fields;

		/**
		 *	Holds fields and generated fields associations
		 *
		 *	@var array
		 */
		private $data;

		/**
		 *	Secret encryption key, be sure to change it to a random value
		 *
		 *	@var string
		 */
		private $secret_key;

		/**
		 *	Constructor
		 *
		 *	@param array $fields: array of your form fields
		 */
		public function __construct($fields) {
			$this->set_fields($fields);
			$this->set_secret_key('EDIT AND ADD YOUR OWN SECRET KEY, *********** NOT A DICTIONARY WORD ***********');
			$this->set_field_length(10);
			$this->data 				  = array();
			$this->generated_fields = array();
		}

		/**
		 *	Set form fields
		 *
		 *	@param array $fields: array of your form fields
		 */
		public function set_fields($fields) {
			$this->fields = $fields;
		}

		/**
		 *	Set secret key for mcrypt
		 *
		 *	@param string $secret_key: secret key to use with mcrypt
		 */
		public function set_secret_key($secret_key) {
			$this->secret_key = $secret_key;
		}

		/**
		 *	Set the length of generated field names
		 *
		 *	@param int $length
		 */
		public function set_field_length($length) {
			$this->field_length = $length;
		}

		/**
		 *	Obfuscate the form and return an array to be used in our form
		 *
		 *	@return assoc array containing fields and random fields
		 */
		public function obfuscate() {
			foreach($this->fields as $field) {
				$this->data[ $field ] = $this->get_random_field_name();
			}
			return $this->data;
		}

		/**
		 *	Generate a random field name, and take care of the duplicates
		 *
		 *	@return string $field_name
		 */
		protected function get_random_field_name() {
			do {
				$field_name = $this->_get_random_field_name();
			} while( in_array($field_name, $this->generated_fields) );
			$this->generated_fields[] = $field_name;
			return $field_name;
		}

		/**
		 *	Generate a random field name
		 *
		 *	@return string $field_name
		 */
		private function _get_random_field_name() {
			return substr(str_shuffle('ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890'), 0, $this->field_length);
		}

		/**
		 *	Encode the form for storage on the client side
		 *
		 *	@return string
		 */
		public function encode_form() {
			return base64_encode(openssl_encrypt(serialize($this->data), "aes-128-ctr", $this->secret_key));
		}

		/**
		 *	Decode the form for use in your script
		 *
		 * @param string $data: encrypted string from encode_form() method
		 * @param array $form: the whole form
		 *	@return array
		 */
		public function decode_form($data, $form) {
			$retrun_array = array();
			$fields 			= unserialize(openssl_decrypt(base64_decode($data), "aes-128-ctr", $this->secret_key));
			foreach($fields as $key => $field) {
				$retrun_array[ $key ] = $form[ $field ];
			}
			return $retrun_array;
		}

	} // Class Form_Obfuscator

?>
