<?php

namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class MainController
{
    /**
     * @var string
     */
    private $environment;

    /**
     * MainController constructor.
     *
     * @param string $environment
     */
    public function __construct(string $environment)
    {
        $this->environment = $environment;
    }

    /**
     * @Route("", name="home")
     *
     * @return Response
     */
    public function home(): Response
    {
        return new Response('<html><body><h1>Welcome in ' . $this->environment . ' environment</h1></body></html>');
    }
}
