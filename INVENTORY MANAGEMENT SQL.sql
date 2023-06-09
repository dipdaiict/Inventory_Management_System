PGDMP     #                    z            dip editing2    15.0    15.0                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16962    dip editing2    DATABASE     �   CREATE DATABASE "dip editing2" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE "dip editing2";
                postgres    false            �            1259    16963    customer    TABLE     �   CREATE TABLE public.customer (
    customer_id integer NOT NULL,
    customer_name character varying(100),
    customer_address character varying(100),
    mobile_no character varying(15)
);
    DROP TABLE public.customer;
       public         heap    postgres    false            �            1259    16966    item    TABLE     �   CREATE TABLE public.item (
    item_id bigint NOT NULL,
    supplier_id integer,
    item_name character varying(50),
    purchase_rate double precision,
    sale_rate double precision,
    qoh integer
);
    DROP TABLE public.item;
       public         heap    postgres    false            �            1259    16969    item_item_id_seq    SEQUENCE     y   CREATE SEQUENCE public.item_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.item_item_id_seq;
       public          postgres    false    215                       0    0    item_item_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.item_item_id_seq OWNED BY public.item.item_id;
          public          postgres    false    216            �            1259    16970 	   logindata    TABLE     z   CREATE TABLE public.logindata (
    id integer,
    username character varying(10),
    password character varying(10)
);
    DROP TABLE public.logindata;
       public         heap    postgres    false            �            1259    16973    pmaster    TABLE       CREATE TABLE public.pmaster (
    purchase_id bigint NOT NULL,
    item_id integer,
    supplier_id integer,
    purchase_date date,
    item_name character varying(50),
    supplier_name character varying(50),
    quantity integer,
    total_amount double precision
);
    DROP TABLE public.pmaster;
       public         heap    postgres    false            �            1259    16976    pmaster_purchase_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pmaster_purchase_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.pmaster_purchase_id_seq;
       public          postgres    false    218                        0    0    pmaster_purchase_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.pmaster_purchase_id_seq OWNED BY public.pmaster.purchase_id;
          public          postgres    false    219            �            1259    16977    smaster    TABLE     /  CREATE TABLE public.smaster (
    sale_id bigint NOT NULL,
    item_id integer,
    customer_id integer,
    item_name character varying(50),
    customer_name character varying(50),
    supplier_name character varying(50),
    sale_date date,
    quantity integer,
    total_amount double precision
);
    DROP TABLE public.smaster;
       public         heap    postgres    false            �            1259    16980    smaster_sale_id_seq    SEQUENCE     |   CREATE SEQUENCE public.smaster_sale_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.smaster_sale_id_seq;
       public          postgres    false    220            !           0    0    smaster_sale_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.smaster_sale_id_seq OWNED BY public.smaster.sale_id;
          public          postgres    false    221            �            1259    16981    supplier    TABLE     �   CREATE TABLE public.supplier (
    supplier_id integer NOT NULL,
    supplier_name character varying(100) NOT NULL,
    supplier_address character varying(100),
    mobile_no character varying(15)
);
    DROP TABLE public.supplier;
       public         heap    postgres    false            {           2604    16984    item item_id    DEFAULT     l   ALTER TABLE ONLY public.item ALTER COLUMN item_id SET DEFAULT nextval('public.item_item_id_seq'::regclass);
 ;   ALTER TABLE public.item ALTER COLUMN item_id DROP DEFAULT;
       public          postgres    false    216    215            |           2604    16985    pmaster purchase_id    DEFAULT     z   ALTER TABLE ONLY public.pmaster ALTER COLUMN purchase_id SET DEFAULT nextval('public.pmaster_purchase_id_seq'::regclass);
 B   ALTER TABLE public.pmaster ALTER COLUMN purchase_id DROP DEFAULT;
       public          postgres    false    219    218            }           2604    16986    smaster sale_id    DEFAULT     r   ALTER TABLE ONLY public.smaster ALTER COLUMN sale_id SET DEFAULT nextval('public.smaster_sale_id_seq'::regclass);
 >   ALTER TABLE public.smaster ALTER COLUMN sale_id DROP DEFAULT;
       public          postgres    false    221    220                      0    16963    customer 
   TABLE DATA           [   COPY public.customer (customer_id, customer_name, customer_address, mobile_no) FROM stdin;
    public          postgres    false    214   !                 0    16966    item 
   TABLE DATA           ^   COPY public.item (item_id, supplier_id, item_name, purchase_rate, sale_rate, qoh) FROM stdin;
    public          postgres    false    215   �!                 0    16970 	   logindata 
   TABLE DATA           ;   COPY public.logindata (id, username, password) FROM stdin;
    public          postgres    false    217   \$                 0    16973    pmaster 
   TABLE DATA           �   COPY public.pmaster (purchase_id, item_id, supplier_id, purchase_date, item_name, supplier_name, quantity, total_amount) FROM stdin;
    public          postgres    false    218   �$                 0    16977    smaster 
   TABLE DATA           �   COPY public.smaster (sale_id, item_id, customer_id, item_name, customer_name, supplier_name, sale_date, quantity, total_amount) FROM stdin;
    public          postgres    false    220   �'                 0    16981    supplier 
   TABLE DATA           [   COPY public.supplier (supplier_id, supplier_name, supplier_address, mobile_no) FROM stdin;
    public          postgres    false    222    *       "           0    0    item_item_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.item_item_id_seq', 24, true);
          public          postgres    false    216            #           0    0    pmaster_purchase_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.pmaster_purchase_id_seq', 25, true);
          public          postgres    false    219            $           0    0    smaster_sale_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.smaster_sale_id_seq', 19, true);
          public          postgres    false    221                       2606    16988    customer customer_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);
 @   ALTER TABLE ONLY public.customer DROP CONSTRAINT customer_pkey;
       public            postgres    false    214            �           2606    16990    supplier supplier_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (supplier_id);
 @   ALTER TABLE ONLY public.supplier DROP CONSTRAINT supplier_pkey;
       public            postgres    false    222               �   x�E�AN�0E��S�HI��x�X��VHVl5��.r��Ӛv;���ka�֯�C��K<�FB���	9��igU[)�fȧ4³`��hP�6���{Xg K�4!9��=/|��\K�Y��je��(�ٍ^�y���א*�UO�s��,C�HZYx�xͥ�EG���C���u	�WN�iM���+D�x���y�$`ui������/��]�         S  x�US�n�0</�b�ɡI�z�h�6IāO�ldFb�G@I	��]ʮ�l�3�3�+
�c�j��~�][�϶�pս�Y�F�2#!��3�W���<5�H=���"���4����j�Y����c�	�����K�xx��Fo�X���]��c_͔L�	R���^GϘ#}R���.>���fC��<�H����a�W��Zܴ6�6up*� f�J��55TZ��j�#����b�6�!���;��	��x��{̃��D�7����ih	���=�#�����*��.i��=���ڡ��w��ƚ�G�hrto��{�<��� :����\���������xU,�Ӵ�z?�,����*�3�|m�CӠ`5�I����E����m�����Ȧs:qZ_ �]���_HH_╒�Ӿ�y�*�h���lBm��@j����x�|���Z�%ᕾ��l�p�T������>y۸��mE������$J0�J����<�k��!|ܼ�F���f�5]�[>��y��Fc6.X�k!Ϯ���\�t�R�Zr�Esy1d����Y/w�I")�|B�g�m            x�3��H,J���442����� +%�            x���[O�@��׿b�!�����1	-m��ڪ/C�����|��{�6�A���X����<�3���GK�fJΤn2[?0oimr�i�6��
Zg\�rkiѶLJ�]*>]��݊�:�RzZ�)/뮼5\R��U�ҧ�i�liU��eͥ܃O<_���IP�\sA_��!Q+��{�ĳZ���ͥ��1���ki�Mgۆ|����2��vԚf@j)E�]^��C�]v�=�ЫM�wM�.��t�P�Hvઙ����j�X��*<���@v"�\�"Me�x�b[UC����������DJ��">��2(��麪�잛��O:���$$��@"�C�U�ď\"c�ȹɘZ�sBD��9�t�I*�.,��,���	OGy�99l���h<х��%]�� "p��3Qp�>�8�S˖�pN��
��b�`%�돂���a�̗������ʷ���+1���3���ׄ����i�w����
n?��.s��5�%�⩫��v٪���Q_��t"����X��<e�g=���1m6����bw�8�j��0Д�m�h��ݼǯ`j�1Z���g��d�eZa8�GQzt��K�s� \����rST8���}H?�����C�; :p�h�o�-]��5�e_���_c+xg�(5��p��Eͩ[�KӀׯٷh��<����~�vRU��9-g����<~�گ8�?]��W5�m�E^��Y�Ŗ�CU�w� &US�Y�qwz�݈&��n>/?�,onķ�?��Ʈ�?�y�����         Z  x���Ko�0�ϫ_�crpAR��4ͣE�:ڢ�MDX��(*@�}G��$v�h��.�O3;�U�p��W��1�bnjs�Ņ3�1��]��b�=%�rA�j�����K�.��r&�����j��DƤ$ũ����x5�)MI� ��4����ǲk�^�o�I65��;1��3�Ӷ��@J)����Q��^�7�����;#.��W�pC_����	�w�UKRy&�U#Bz�pcŹ��D�Rw®��5�d�S
P*AJHE0[8�m-�c7X/f�4Bk�����wn���ޗ���Κ�I+Bk� �t�@��۽�����$�/�s�Kۈ��7\��)1�H�2�W��bGwy�5<�(V:
@�(Z���)�;S�;��ִ��F�C��{���L=�B
�$�����(0F�V�uD�����ƶ�]�n_��8�I#�0���p^�~�[�7\�V�VN6ܓ�5H|�#�9�CT�2�����x�Gkd=����H��x��=\���['�Fax�c�u׉�~�� �m�׈��7��q�Df�L!|�7>�l��C�00j�ir�D���(���������mL�fn�|���n����� ~< ��         �   x�M��j�0����S�	
It-c�Д�(%-݌#�L���B޾��E����`��T��ᐇ��&m5)2��:J�Q�ڍ>O)J�{�c �-Yg�U����g&/o<2�rC�,*xx�hC�2+K��QCs��9��^��cTH�1����c�Z�s�4���5�h�0[X���^��-����w�Wϑ�f�C���'��k[�=���׮My     