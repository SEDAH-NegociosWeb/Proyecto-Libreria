<?php
/**
 * PHP Version 7.2
 *
 * @category Private
 * @package  Controllers
 * @author   Orlando J Betancourth <orlando.betancourth@gmail.com>
 * @license  MIT http://
 * @version  CVS:1.0.0
 * @link     http://
 */
namespace Controllers;

use Exception;
use Views\Renderer;

/**
 * Private Access Controller Base Class
 *
 * @category Public
 * @package  Controllers
 * @author   Orlando J Betancourth <orlando.betancourth@gmail.com>
 * @license  MIT http://
 * @link     http://
 */
abstract class PrivateController extends PublicController
{

    public function run(): void
    {

        $this->init();

        $email = \Utilities\Security::getUserEmail();
        $dbUser = \Dao\Security\Security::getUsuarioByEmail($email);
        
        // if ($dbUser["usertipo"] == "ADM") {
        //     $this->viewdata["mode"] = "ADM";
        // }
        // else {
        //     $this->viewdata["mode"] === "PBL";
        // }

        // if ($this->viewdata["mode"] === "ADM") {
        //     $this->viewdata["showOption"] = true;
        // }
        // else {
        //     $this->viewdata["showOption"] = false;
        // }

        Renderer::render('Views/templates/private', $this->viewdata);

    }
    private function init()
    {
        $this->viewdata = array();
        $this->viewdata["mode"] = "";
        $this->viewdata["showOption"] = true;
    }
    private function _isAuthorized()
    {
        $isAuthorized = \Utilities\Security::isAuthorized(
            \Utilities\Security::getUserId(),
            $this->name
        );
        if (!$isAuthorized) {
            throw new PrivateNoAuthException();
        }
    }
    private function _isAuthenticated()
    {
        if (!\Utilities\Security::isLogged()) {
            throw new PrivateNoLoggedException();
        }
    }
    protected function isFeatureAutorized($feature): bool
    {
        return \Utilities\Security::isAuthorized(
            \Utilities\Security::getUserId(),
            $feature
        );
    }
    public function __construct()
    {
        parent::__construct();
        $this->_isAuthenticated();
        $this->_isAuthorized();

    }
}

?>
